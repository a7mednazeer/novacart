import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';

class OrderRemoteDataSource {
  OrderRemoteDataSource(this._firestore);
  final FirebaseFirestore? _firestore;

  bool get _isConfigured => _firestore != null;

  // Local memory for mock mode
  final _mockOrders = <String, List<OrderModel>>{};
  final _orderControllers = <String, StreamController<List<OrderModel>>>{};

  StreamController<List<OrderModel>> _getController(String uid) {
    return _orderControllers.putIfAbsent(
      uid,
      () => StreamController<List<OrderModel>>.broadcast(),
    );
  }

  CollectionReference<Map<String, dynamic>> _ordersRef(String uid) =>
      _firestore!.collection('users').doc(uid).collection('orders');

  Future<String> placeOrder(String uid, OrderModel order) async {
    if (!_isConfigured) {
      final id = 'MOCK-ORD-${DateTime.now().millisecondsSinceEpoch}';
      final newOrder = OrderModel(
        id: id,
        items: order.items,
        address: order.address,
        paymentMethod: order.paymentMethod,
        subtotal: order.subtotal,
        discountAmount: order.discountAmount,
        shippingFee: order.shippingFee,
        tax: order.tax,
        total: order.total,
        status: order.status,
        createdAt: order.createdAt,
        estimatedDelivery: order.estimatedDelivery,
        couponCode: order.couponCode,
      );

      _mockOrders[uid] ??= [];
      _mockOrders[uid]!.insert(0, newOrder);
      _getController(uid).add(_mockOrders[uid]!);
      return id;
    }
    
    final ref = await _ordersRef(uid).add(order.toFirestore());
    return ref.id;
  }

  Stream<List<OrderModel>> watchOrders(String uid) async* {
    if (!_isConfigured) {
      _mockOrders[uid] ??= [];
      final controller = _getController(uid);
      // Yield current state immediately so history doesn't hang in loading
      yield _mockOrders[uid]!;
      yield* controller.stream;
      return;
    }

    yield* _ordersRef(uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromFirestore(doc.id, doc.data()))
            .toList());
  }
}
