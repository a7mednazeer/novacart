part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.items = const [],
    this.savedForLater = const [],
    this.isLoading = true,
    this.couponCode,
    this.couponDiscountPercent = 0,
  });

  final List<CartLineItem> items;
  final List<CartLineItem> savedForLater;
  final bool isLoading;
  final String? couponCode;
  final double couponDiscountPercent;

  static const double _taxRate = 0.14; // 14% VAT
  static const double _flatShippingFee = 50;
  static const double _freeShippingThreshold = 1000;

  int get itemCount => items.fold(0, (sum, line) => sum + line.quantity);

  double get subtotal => items.fold(0.0, (sum, line) => sum + line.lineTotal);

  double get discountAmount => subtotal * (couponDiscountPercent / 100);

  double get shippingFee =>
      items.isEmpty || subtotal >= _freeShippingThreshold ? 0 : _flatShippingFee;

  double get taxableAmount => subtotal - discountAmount;

  double get tax => taxableAmount * _taxRate;

  double get total => taxableAmount + tax + shippingFee;

  DateTime get estimatedDelivery => DateTime.now().add(const Duration(days: 4));

  bool get isEmpty => items.isEmpty;

  CartState copyWith({
    List<CartLineItem>? items,
    List<CartLineItem>? savedForLater,
    bool? isLoading,
    String? couponCode,
    double? couponDiscountPercent,
    bool clearCoupon = false,
  }) {
    return CartState(
      items: items ?? this.items,
      savedForLater: savedForLater ?? this.savedForLater,
      isLoading: isLoading ?? this.isLoading,
      couponCode: clearCoupon ? null : (couponCode ?? this.couponCode),
      couponDiscountPercent:
          clearCoupon ? 0 : (couponDiscountPercent ?? this.couponDiscountPercent),
    );
  }

  @override
  List<Object?> get props =>
      [items, savedForLater, isLoading, couponCode, couponDiscountPercent];
}
