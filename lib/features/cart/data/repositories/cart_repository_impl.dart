import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_datasource.dart';
import '../models/cart_item_model.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._dataSource);
  final CartRemoteDataSource _dataSource;

  @override
  Stream<List<CartItemEntity>> watchCart(String uid) {
    return _dataSource.watchCart(uid).handleError((_) => <CartItemModel>[]);
  }

  @override
  Stream<List<CartItemEntity>> watchSavedForLater(String uid) {
    return _dataSource.watchSavedForLater(uid).handleError((_) => <CartItemModel>[]);
  }

  @override
  Future<Either<Failure, void>> addOrUpdateItem(String uid, CartItemEntity item) =>
      _guard(() => _dataSource.addOrUpdateItem(uid, CartItemModel.fromEntity(item)));

  @override
  Future<Either<Failure, void>> updateQuantity(
    String uid,
    String productId,
    int quantity,
  ) =>
      _guard(() => _dataSource.updateQuantity(uid, productId, quantity));

  @override
  Future<Either<Failure, void>> removeItem(String uid, String productId) =>
      _guard(() => _dataSource.removeItem(uid, productId));

  @override
  Future<Either<Failure, void>> moveToSavedForLater(String uid, String productId) =>
      _guard(() => _dataSource.moveToSavedForLater(uid, productId));

  @override
  Future<Either<Failure, void>> moveToCart(String uid, String productId) =>
      _guard(() => _dataSource.moveToCart(uid, productId));

  @override
  Future<Either<Failure, void>> clearCart(String uid) =>
      _guard(() => _dataSource.clearCart(uid));

  Future<Either<Failure, void>> _guard(Future<void> Function() action) async {
    try {
      await action();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
