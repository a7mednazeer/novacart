import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/cart_repository.dart';

class RemoveCartItemUseCase {
  const RemoveCartItemUseCase(this._repository);
  final CartRepository _repository;

  Future<Either<Failure, void>> call(String uid, String productId) {
    return _repository.removeItem(uid, productId);
  }
}
