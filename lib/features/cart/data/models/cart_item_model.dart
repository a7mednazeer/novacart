import '../../domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.productId,
    required super.quantity,
    super.selectedColor,
    super.selectedSize,
  });

  factory CartItemModel.fromFirestore(String productId, Map<String, dynamic> data) {
    return CartItemModel(
      productId: productId,
      quantity: (data['quantity'] as num?)?.toInt() ?? 1,
      selectedColor: data['selectedColor'] as String?,
      selectedSize: data['selectedSize'] as String?,
    );
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      productId: entity.productId,
      quantity: entity.quantity,
      selectedColor: entity.selectedColor,
      selectedSize: entity.selectedSize,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'quantity': quantity,
      'selectedColor': selectedColor,
      'selectedSize': selectedSize,
      'updatedAt': DateTime.now().toIso8601String(),
    };
  }
}
