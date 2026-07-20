import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/usecases/get_products_by_ids_usecase.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../../domain/usecases/add_to_wishlist_usecase.dart';
import '../../domain/usecases/remove_from_wishlist_usecase.dart';

part 'wishlist_state.dart';

/// Registered as a single app-wide singleton (see `injection_container.dart`)
/// and provided once at the app root (`main.dart`) — every screen reads
/// the *same* instance, so favoriting a product on Home instantly shows
/// as favorited on Search, Categories, Product Details, and the
/// Wishlist tab, with no manual refresh.
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(
    this._repository,
    this._addUseCase,
    this._removeUseCase,
    this._getProductsByIds,
    this._currentUser,
  ) : super(const WishlistState());

  final WishlistRepository _repository;
  final AddToWishlistUseCase _addUseCase;
  final RemoveFromWishlistUseCase _removeUseCase;
  final GetProductsByIdsUseCase _getProductsByIds;
  final CurrentUserService _currentUser;

  StreamSubscription<Set<String>>? _subscription;
  String? _activeUid;

  bool isFavorite(String productId) => state.ids.contains(productId);

  /// Idempotent — safe to call from every screen's `initState`. Only
  /// (re)subscribes if the signed-in user actually changed, so signing
  /// out and back in as someone else correctly swaps to their wishlist
  /// instead of showing stale data.
  void ensureStarted() {
    final uid = _currentUser.uid;
    if (uid == null || uid == _activeUid) return;

    _activeUid = uid;
    _subscription?.cancel();
    _subscription = _repository.watchWishlistIds(uid).listen((ids) {
      // If products were already loaded, keep them but filter by the new IDs.
      // If they weren't loaded, we'll wait for the explicit loadProducts() call.
      emit(state.copyWith(
        ids: ids,
        products: _resolveFromCurrentProducts(ids),
      ));
    });
  }

  List<ProductEntity>? _resolveFromCurrentProducts(Set<String> ids) {
    if (state.products == null) return null;
    
    // Check if we have all the product details for the new IDs
    final currentProductIds = state.products!.map((p) => p.id).toSet();
    final missingIds = ids.difference(currentProductIds);

    if (missingIds.isNotEmpty) {
      // We are missing some product details, so we should trigger a reload
      // But we can't await it here in a listener. The UI or a subsequent 
      // call to loadProducts() will handle it.
      return state.products!.where((p) => ids.contains(p.id)).toList();
    }

    return state.products!.where((p) => ids.contains(p.id)).toList();
  }

  /// Fetches full product objects for the current favorited ids — call
  /// this when the Wishlist screen opens.
  Future<void> loadProducts() async {
    emit(state.copyWith(isLoadingProducts: true));
    final result = await _getProductsByIds(state.ids);

    result.fold(
      (failure) => emit(state.copyWith(isLoadingProducts: false)),
      (products) => emit(state.copyWith(products: products, isLoadingProducts: false)),
    );
  }

  Future<void> toggle(String productId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;

    final wasFavorited = state.ids.contains(productId);
    final updatedIds = {...state.ids};
    wasFavorited ? updatedIds.remove(productId) : updatedIds.add(productId);

    // Optimistic UI update — the Firestore stream will reconcile this
    // shortly after with the authoritative value.
    emit(state.copyWith(
      ids: updatedIds,
      products: state.products?.where((p) => updatedIds.contains(p.id)).toList(),
    ));

    if (wasFavorited) {
      await _removeUseCase(uid, productId);
    } else {
      await _addUseCase(uid, productId);
    }

    // Force a reload of products to ensure the UI shows the newly added item
    if (!wasFavorited) {
      await loadProducts();
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
