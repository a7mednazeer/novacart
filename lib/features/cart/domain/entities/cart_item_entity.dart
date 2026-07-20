import 'package:equatable/equatable.dart';

/// The raw, persisted shape of one cart line: a product id plus the
/// user's selections and quantity. Deliberately does *not* embed
/// product name/price/image — those always come fresh from the
/// catalog via `GetProductsByIdsUseCase`, so a price change server-side
/// is reflected immediately instead of showing stale cached data.
class CartItemEntity extends Equatable {
  const CartItemEntity({
    required this.productId,
    required this.quantity,
    this.selectedColor,
    this.selectedSize,
  });

  final String productId;
  final int quantity;
  final String? selectedColor;
  final String? selectedSize;

  CartItemEntity copyWith({int? quantity}) {
    return CartItemEntity(
      productId: productId,
      quantity: quantity ?? this.quantity,
      selectedColor: selectedColor,
      selectedSize: selectedSize,
    );
  }

  @override
  List<Object?> get props => [productId, quantity, selectedColor, selectedSize];
}
