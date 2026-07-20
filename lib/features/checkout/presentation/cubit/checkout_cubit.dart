import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../../cart/presentation/cubit/cart_line_item.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_item_entity.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/repositories/address_repository.dart';
import '../../domain/usecases/add_address_usecase.dart';
import '../../domain/usecases/place_order_usecase.dart';

part 'checkout_state.dart';

/// Unlike `WishlistCubit`/`CartCubit`, this one is a per-checkout-session
/// factory (a fresh instance each time Checkout opens) since its state
/// (selected step, selected address/payment) has no reason to persist
/// once checkout is done or abandoned.
class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(
    this._addressRepository,
    this._addAddressUseCase,
    this._placeOrderUseCase,
    this._currentUser,
  ) : super(const CheckoutState());

  final AddressRepository _addressRepository;
  final AddAddressUseCase _addAddressUseCase;
  final PlaceOrderUseCase _placeOrderUseCase;
  final CurrentUserService _currentUser;

  StreamSubscription<List<AddressEntity>>? _addressSubscription;

  void loadAddresses() {
    final uid = _currentUser.uid;
    if (uid == null) return;

    _addressSubscription?.cancel();
    _addressSubscription = _addressRepository.watchAddresses(uid).listen((addresses) {
      final currentSelection = state.selectedAddressId;
      final stillExists = addresses.any((a) => a.id == currentSelection);

      String? nextSelection = stillExists ? currentSelection : null;
      nextSelection ??= addresses.where((a) => a.isDefault).firstOrNull?.id;
      nextSelection ??= addresses.firstOrNull?.id;

      emit(state.copyWith(
        addresses: addresses,
        selectedAddressId: nextSelection,
        isLoadingAddresses: false,
      ));
    });
  }

  void selectAddress(String addressId) {
    emit(state.copyWith(selectedAddressId: addressId));
  }

  void selectPaymentMethod(PaymentMethodType method) {
    emit(state.copyWith(paymentMethod: method));
  }

  void goToStep(CheckoutStep step) => emit(state.copyWith(step: step));

  void nextStep() {
    switch (state.step) {
      case CheckoutStep.address:
        emit(state.copyWith(step: CheckoutStep.payment));
        break;
      case CheckoutStep.payment:
        emit(state.copyWith(step: CheckoutStep.review));
        break;
      case CheckoutStep.review:
        break;
    }
  }

  void previousStep() {
    switch (state.step) {
      case CheckoutStep.payment:
        emit(state.copyWith(step: CheckoutStep.address));
        break;
      case CheckoutStep.review:
        emit(state.copyWith(step: CheckoutStep.payment));
        break;
      case CheckoutStep.address:
        break;
    }
  }

  Future<bool> addAddress({
    required String fullName,
    required String phone,
    required String addressLine,
    required String city,
  }) async {
    final uid = _currentUser.uid;
    if (uid == null) return false;

    final result = await _addAddressUseCase(
      uid,
      AddressEntity(
        id: '',
        fullName: fullName,
        phone: phone,
        addressLine: addressLine,
        city: city,
        isDefault: state.addresses.isEmpty,
      ),
    );

    return result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message));
        return false;
      },
      (newId) {
        emit(state.copyWith(selectedAddressId: newId, clearError: true));
        return true;
      },
    );
  }

  Future<void> placeOrder({
    required List<CartLineItem> cartItems,
    required double subtotal,
    required double discountAmount,
    required double shippingFee,
    required double tax,
    required double total,
    required DateTime estimatedDelivery,
    String? couponCode,
  }) async {
    final uid = _currentUser.uid;
    final address = state.selectedAddress;
    if (uid == null || address == null) return;

    emit(state.copyWith(isPlacingOrder: true, clearError: true));

    final order = OrderEntity(
      id: '',
      items: cartItems
          .map((line) => OrderItemEntity(
                productId: line.productId,
                name: line.product.name,
                imageUrl: line.product.imageUrl,
                unitPrice: line.product.discountedPrice,
                quantity: line.quantity,
                selectedColor: line.item.selectedColor,
                selectedSize: line.item.selectedSize,
              ))
          .toList(),
      address: address,
      paymentMethod: state.paymentMethod,
      subtotal: subtotal,
      discountAmount: discountAmount,
      shippingFee: shippingFee,
      tax: tax,
      total: total,
      status: OrderStatus.processing,
      createdAt: DateTime.now(),
      estimatedDelivery: estimatedDelivery,
      couponCode: couponCode,
    );

    final result = await _placeOrderUseCase(uid, order);

    result.fold(
      (failure) => emit(state.copyWith(
        isPlacingOrder: false,
        errorMessage: failure.message,
      )),
      (orderId) => emit(state.copyWith(
        isPlacingOrder: false,
        placedOrder: order.copyWith(id: orderId),
      )),
    );
  }

  @override
  Future<void> close() {
    _addressSubscription?.cancel();
    return super.close();
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
