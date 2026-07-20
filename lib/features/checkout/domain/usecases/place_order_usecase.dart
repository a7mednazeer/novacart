import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class PlaceOrderUseCase {
  const PlaceOrderUseCase(this._repository);
  final OrderRepository _repository;

  Future<Either<Failure, String>> call(String uid, OrderEntity order) {
    return _repository.placeOrder(uid, order);
  }
}
