import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/cart_repository.dart';

class UpdateCartQuantityUseCase {
  const UpdateCartQuantityUseCase(this._repository);
  final CartRepository _repository;

  Future<Either<Failure, void>> call(String uid, String productId, int quantity) {
    return _repository.updateQuantity(uid, productId, quantity);
  }
}
