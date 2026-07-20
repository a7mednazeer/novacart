import 'package:equatable/equatable.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/entities/cart_item_entity.dart';

class CartLineItem extends Equatable {
  const CartLineItem({required this.item, required this.product});

  final CartItemEntity item;
  final ProductEntity product;

  String get productId => item.productId;
  int get quantity => item.quantity;
  double get lineTotal => product.discountedPrice * item.quantity;

  @override
  List<Object?> get props => [item, product];
}
