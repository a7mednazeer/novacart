import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/cart_item_entity.dart';

abstract class CartRepository {
  /// Active cart items (not saved-for-later).
  Stream<List<CartItemEntity>> watchCart(String uid);

  /// Items the user moved to "Save for Later".
  Stream<List<CartItemEntity>> watchSavedForLater(String uid);

  Future<Either<Failure, void>> addOrUpdateItem(String uid, CartItemEntity item);

  Future<Either<Failure, void>> updateQuantity(
    String uid,
    String productId,
    int quantity,
  );

  Future<Either<Failure, void>> removeItem(String uid, String productId);

  Future<Either<Failure, void>> moveToSavedForLater(String uid, String productId);

  Future<Either<Failure, void>> moveToCart(String uid, String productId);

  /// Deletes every active cart item for [uid] — called after a
  /// successful order placement. Saved-for-later items are untouched.
  Future<Either<Failure, void>> clearCart(String uid);
}
