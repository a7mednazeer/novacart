import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/cart_item_entity.dart';
import '../repositories/cart_repository.dart';

class AddOrUpdateCartItemUseCase {
  const AddOrUpdateCartItemUseCase(this._repository);
  final CartRepository _repository;

  Future<Either<Failure, void>> call(String uid, CartItemEntity item) {
    return _repository.addOrUpdateItem(uid, item);
  }
}
