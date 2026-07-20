import '../../domain/entities/address_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_item_entity.dart';
import '../../domain/entities/payment_method.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.items,
    required super.address,
    required super.paymentMethod,
    required super.subtotal,
    required super.discountAmount,
    required super.shippingFee,
    required super.tax,
    required super.total,
    required super.status,
    required super.createdAt,
    required super.estimatedDelivery,
    super.couponCode,
  });

  factory OrderModel.fromFirestore(String id, Map<String, dynamic> data) {
    final addressData = data['address'] as Map<String, dynamic>? ?? {};
    final itemsData = (data['items'] as List?) ?? [];

    return OrderModel(
      id: id,
      items: itemsData.map((raw) {
        final item = raw as Map<String, dynamic>;
        return OrderItemEntity(
          productId: item['productId'] as String? ?? '',
          name: item['name'] as String? ?? '',
          imageUrl: item['imageUrl'] as String? ?? '',
          unitPrice: (item['unitPrice'] as num?)?.toDouble() ?? 0,
          quantity: (item['quantity'] as num?)?.toInt() ?? 1,
          selectedColor: item['selectedColor'] as String?,
          selectedSize: item['selectedSize'] as String?,
        );
      }).toList(),
      address: AddressEntity(
        id: addressData['id'] as String? ?? '',
        fullName: addressData['fullName'] as String? ?? '',
        phone: addressData['phone'] as String? ?? '',
        addressLine: addressData['addressLine'] as String? ?? '',
        city: addressData['city'] as String? ?? '',
      ),
      paymentMethod: PaymentMethodType.values.firstWhere(
        (t) => t.name == data['paymentMethod'],
        orElse: () => PaymentMethodType.cashOnDelivery,
      ),
      subtotal: (data['subtotal'] as num?)?.toDouble() ?? 0,
      discountAmount: (data['discountAmount'] as num?)?.toDouble() ?? 0,
      shippingFee: (data['shippingFee'] as num?)?.toDouble() ?? 0,
      tax: (data['tax'] as num?)?.toDouble() ?? 0,
      total: (data['total'] as num?)?.toDouble() ?? 0,
      status: OrderStatus.values.firstWhere(
        (s) => s.name == data['status'],
        orElse: () => OrderStatus.processing,
      ),
      createdAt: DateTime.tryParse(data['createdAt'] as String? ?? '') ??
          DateTime.now(),
      estimatedDelivery:
          DateTime.tryParse(data['estimatedDelivery'] as String? ?? '') ??
              DateTime.now().add(const Duration(days: 4)),
      couponCode: data['couponCode'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'items': items
          .map((item) => {
                'productId': item.productId,
                'name': item.name,
                'imageUrl': item.imageUrl,
                'unitPrice': item.unitPrice,
                'quantity': item.quantity,
                'selectedColor': item.selectedColor,
                'selectedSize': item.selectedSize,
              })
          .toList(),
      'address': {
        'id': address.id,
        'fullName': address.fullName,
        'phone': address.phone,
        'addressLine': address.addressLine,
        'city': address.city,
      },
      'paymentMethod': paymentMethod.name,
      'subtotal': subtotal,
      'discountAmount': discountAmount,
      'shippingFee': shippingFee,
      'tax': tax,
      'total': total,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'estimatedDelivery': estimatedDelivery.toIso8601String(),
      'couponCode': couponCode,
    };
  }
}
