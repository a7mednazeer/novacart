import 'package:dartz/dartz.dart';
import 'package:novacart/core/errors/failures.dart';
import 'package:novacart/features/checkout/domain/entities/order_entity.dart';
import 'package:novacart/features/checkout/domain/repositories/order_repository.dart';
import 'package:novacart/features/checkout/data/datasources/order_remote_datasource.dart';
import 'package:novacart/features/checkout/data/models/order_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this._dataSource);
  final OrderRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, String>> placeOrder(String uid, OrderEntity order) async {
    try {
      final model = OrderModel(
        id: '',
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
      final id = await _dataSource.placeOrder(uid, model);
      return Right(id);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<OrderEntity>> watchOrders(String uid) {
    return _dataSource.watchOrders(uid).map((models) {
      return models.map((m) => m as OrderEntity).toList();
    }).handleError((_) => <OrderEntity>[]);
  }
}
