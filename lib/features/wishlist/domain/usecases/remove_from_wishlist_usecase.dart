import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/wishlist_repository.dart';

class RemoveFromWishlistUseCase {
  const RemoveFromWishlistUseCase(this._repository);
  final WishlistRepository _repository;

  Future<Either<Failure, void>> call(String uid, String productId) {
    return _repository.removeFromWishlist(uid, productId);
  }
}
