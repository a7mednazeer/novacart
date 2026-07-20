import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, String>> placeOrder(String uid, OrderEntity order);

  Stream<List<OrderEntity>> watchOrders(String uid);
}
