import 'package:equatable/equatable.dart';
import 'address_entity.dart';
import 'order_item_entity.dart';
import 'payment_method.dart';

enum OrderStatus { processing, shipped, outForDelivery, delivered, cancelled }

extension OrderStatusDisplay on OrderStatus {
  String get label => switch (this) {
        OrderStatus.processing => 'Processing',
        OrderStatus.shipped => 'Shipped',
        OrderStatus.outForDelivery => 'Out for Delivery',
        OrderStatus.delivered => 'Delivered',
        OrderStatus.cancelled => 'Cancelled',
      };
}

class OrderEntity extends Equatable {
  const OrderEntity({
    required this.id,
    required this.items,
    required this.address,
    required this.paymentMethod,
    required this.subtotal,
    required this.discountAmount,
    required this.shippingFee,
    required this.tax,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.estimatedDelivery,
    this.couponCode,
  });

  final String id;
  final List<OrderItemEntity> items;
  final AddressEntity address;
  final PaymentMethodType paymentMethod;
  final double subtotal;
  final double discountAmount;
  final double shippingFee;
  final double tax;
  final double total;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime estimatedDelivery;
  final String? couponCode;

  int get itemCount => items.fold(0, (sum, i) => sum + i.quantity);

  OrderEntity copyWith({String? id}) {
    return OrderEntity(
      id: id ?? this.id,
      items: items,
      address: address,
      paymentMethod: paymentMethod,
      subtotal: subtotal,
      discountAmount: discountAmount,
      shippingFee: shippingFee,
      tax: tax,
      total: total,
      status: status,
      createdAt: createdAt,
      estimatedDelivery: estimatedDelivery,
      couponCode: couponCode,
    );
  }

  @override
  List<Object?> get props => [id, items, total, status, createdAt];
}
