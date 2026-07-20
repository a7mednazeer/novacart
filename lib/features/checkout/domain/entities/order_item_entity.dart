import 'package:equatable/equatable.dart';

/// Unlike a cart line (which always resolves live against the
/// catalog), an order line is a **snapshot**: name/price/image are
/// copied at the moment of purchase so order history stays accurate
/// even if the product is later repriced, renamed, or removed from
/// the catalog entirely.
class OrderItemEntity extends Equatable {
  const OrderItemEntity({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.unitPrice,
    required this.quantity,
    this.selectedColor,
    this.selectedSize,
  });

  final String productId;
  final String name;
  final String imageUrl;
  final double unitPrice;
  final int quantity;
  final String? selectedColor;
  final String? selectedSize;

  double get lineTotal => unitPrice * quantity;

  @override
  List<Object?> get props => [productId, name, unitPrice, quantity];
}
