import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_remote_datasource.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl(this._dataSource);
  final WishlistRemoteDataSource _dataSource;

  @override
  Stream<Set<String>> watchWishlistIds(String uid) {
    return _dataSource.watchWishlistIds(uid).handleError((_) => <String>{});
  }

  @override
  Future<Either<Failure, void>> addToWishlist(String uid, String productId) async {
    try {
      await _dataSource.addToWishlist(uid, productId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromWishlist(String uid, String productId) async {
    try {
      await _dataSource.removeFromWishlist(uid, productId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
