import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/usecases/get_products_by_ids_usecase.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../data/repositories/cart_repository_impl.dart';
import '../../domain/usecases/add_or_update_cart_item_usecase.dart';
import '../../domain/usecases/move_to_cart_usecase.dart';
import '../../domain/usecases/move_to_saved_for_later_usecase.dart';
import '../../domain/usecases/remove_cart_item_usecase.dart';
import '../../domain/usecases/update_cart_quantity_usecase.dart';
import 'cart_line_item.dart';

part 'cart_state.dart';

/// Mock coupon codes for demo purposes — validated client-side. Move
/// this to a Firestore `coupons` collection (with server-side
/// validation via a Cloud Function) before accepting real payments,
/// since a client-only discount check can't be trusted in production.
const Map<String, double> _mockCoupons = {
  'NOVA10': 10,
  'NOVA20': 20,
  'WELCOME15': 15,
};

/// Registered as a single app-wide singleton, same pattern as
/// `WishlistCubit` — one shared cart state for the whole signed-in
/// session, synced live from Firestore.
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._repository,
    this._addOrUpdateUseCase,
    this._updateQuantityUseCase,
    this._removeItemUseCase,
    this._moveToSavedUseCase,
    this._moveToCartUseCase,
    this._getProductsByIds,
    this._currentUser,
  ) : super(const CartState());

  final CartRepository _repository;
  final AddOrUpdateCartItemUseCase _addOrUpdateUseCase;
  final UpdateCartQuantityUseCase _updateQuantityUseCase;
  final RemoveCartItemUseCase _removeItemUseCase;
  final MoveToSavedForLaterUseCase _moveToSavedUseCase;
  final MoveToCartUseCase _moveToCartUseCase;
  final GetProductsByIdsUseCase _getProductsByIds;
  final CurrentUserService _currentUser;

  StreamSubscription<List<CartItemEntity>>? _cartSubscription;
  StreamSubscription<List<CartItemEntity>>? _savedSubscription;
  String? _activeUid;

  List<CartItemEntity> _rawCart = [];
  List<CartItemEntity> _rawSaved = [];

  void ensureStarted() {
    final uid = _currentUser.uid;
    if (uid == null || uid == _activeUid) return;

    _activeUid = uid;
    _cartSubscription?.cancel();
    _savedSubscription?.cancel();
    emit(state.copyWith(isLoading: true));

    _cartSubscription = _repository.watchCart(uid).listen((items) {
      _rawCart = items;
      _recompute();
    });
    _savedSubscription = _repository.watchSavedForLater(uid).listen((items) {
      _rawSaved = items;
      _recompute();
    });
  }

  Future<void> _recompute() async {
    final allIds = {
      ..._rawCart.map((e) => e.productId),
      ..._rawSaved.map((e) => e.productId),
    };

    if (allIds.isEmpty) {
      emit(state.copyWith(items: [], savedForLater: [], isLoading: false));
      return;
    }

    final result = await _getProductsByIds(allIds);
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false)),
      (products) {
        CartLineItem? resolve(CartItemEntity raw) {
          for (final product in products) {
            if (product.id == raw.productId) {
              return CartLineItem(item: raw, product: product);
            }
          }
          return null;
        }

        emit(state.copyWith(
          items: _rawCart.map(resolve).whereType<CartLineItem>().toList(),
          savedForLater: _rawSaved.map(resolve).whereType<CartLineItem>().toList(),
          isLoading: false,
        ));
      },
    );
  }

  Future<void> addItem(
    ProductEntity product, {
    String? color,
    String? size,
    int quantity = 1,
  }) async {
    final uid = _currentUser.uid;
    if (uid == null) return;

    final existingQuantity = _rawCart
        .where((e) => e.productId == product.id)
        .fold<int>(0, (sum, e) => sum + e.quantity);

    await _addOrUpdateUseCase(
      uid,
      CartItemEntity(
        productId: product.id,
        quantity: existingQuantity + quantity,
        selectedColor: color,
        selectedSize: size,
      ),
    );
    
    // In mock mode, the listener might need a nudge to refresh immediately
    if (_repository is! CartRepositoryImpl) {
       await _recompute();
    }
  }

  Future<void> incrementQuantity(String productId) async {
    final uid = _currentUser.uid;
    final line = _findLine(productId);
    if (uid == null || line == null) return;
    await _updateQuantityUseCase(uid, productId, line.quantity + 1);
  }

  Future<void> decrementQuantity(String productId) async {
    final uid = _currentUser.uid;
    final line = _findLine(productId);
    if (uid == null || line == null) return;

    if (line.quantity <= 1) {
      await _removeItemUseCase(uid, productId);
    } else {
      await _updateQuantityUseCase(uid, productId, line.quantity - 1);
    }
  }

  Future<void> removeItem(String productId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _removeItemUseCase(uid, productId);
  }

  Future<void> saveForLater(String productId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _moveToSavedUseCase(uid, productId);
  }

  Future<void> moveToCart(String productId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _moveToCartUseCase(uid, productId);
  }

  CartLineItem? _findLine(String productId) {
    for (final line in state.items) {
      if (line.productId == productId) return line;
    }
    return null;
  }

  /// Returns true if [code] is a valid coupon and it was applied.
  bool applyCoupon(String code) {
    final normalized = code.trim().toUpperCase();
    final discount = _mockCoupons[normalized];
    if (discount == null) return false;

    emit(state.copyWith(couponCode: normalized, couponDiscountPercent: discount));
    return true;
  }

  void removeCoupon() => emit(state.copyWith(clearCoupon: true));

  /// Called by Checkout right after an order is successfully placed.
  Future<void> clearCart() async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _repository.clearCart(uid);
    emit(state.copyWith(clearCoupon: true));
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    _savedSubscription?.cancel();
    return super.close();
  }
}
