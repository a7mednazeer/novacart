part of 'checkout_cubit.dart';

enum CheckoutStep { address, payment, review }

class CheckoutState extends Equatable {
  const CheckoutState({
    this.addresses = const [],
    this.selectedAddressId,
    this.paymentMethod = PaymentMethodType.cashOnDelivery,
    this.step = CheckoutStep.address,
    this.isLoadingAddresses = true,
    this.isPlacingOrder = false,
    this.placedOrder,
    this.errorMessage,
  });

  final List<AddressEntity> addresses;
  final String? selectedAddressId;
  final PaymentMethodType paymentMethod;
  final CheckoutStep step;
  final bool isLoadingAddresses;
  final bool isPlacingOrder;
  final OrderEntity? placedOrder;
  final String? errorMessage;

  AddressEntity? get selectedAddress {
    if (selectedAddressId == null) return null;
    for (final address in addresses) {
      if (address.id == selectedAddressId) return address;
    }
    return null;
  }

  bool get canProceedFromAddress => selectedAddress != null;

  CheckoutState copyWith({
    List<AddressEntity>? addresses,
    String? selectedAddressId,
    PaymentMethodType? paymentMethod,
    CheckoutStep? step,
    bool? isLoadingAddresses,
    bool? isPlacingOrder,
    OrderEntity? placedOrder,
    String? errorMessage,
    bool clearError = false,
  }) {
    return CheckoutState(
      addresses: addresses ?? this.addresses,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      step: step ?? this.step,
      isLoadingAddresses: isLoadingAddresses ?? this.isLoadingAddresses,
      isPlacingOrder: isPlacingOrder ?? this.isPlacingOrder,
      placedOrder: placedOrder ?? this.placedOrder,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        addresses,
        selectedAddressId,
        paymentMethod,
        step,
        isLoadingAddresses,
        isPlacingOrder,
        placedOrder,
        errorMessage,
      ];
}
