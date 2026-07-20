import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/cart_repository.dart';

class MoveToSavedForLaterUseCase {
  const MoveToSavedForLaterUseCase(this._repository);
  final CartRepository _repository;

  Future<Either<Failure, void>> call(String uid, String productId) {
    return _repository.moveToSavedForLater(uid, productId);
  }
}
