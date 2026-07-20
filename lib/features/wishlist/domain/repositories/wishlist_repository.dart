import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class WishlistRepository {
  /// Real-time stream of favorited product ids for [uid]. Any screen
  /// (Home, Categories, Search, Product Details) reading from the
  /// shared `WishlistCubit` sees updates the instant Firestore
  /// confirms a write — that's the "sync" in "synchronization across
  /// devices" from the spec, scoped here to sync across screens within
  /// one signed-in session; the same stream would reflect another
  /// device's changes too since both read the same Firestore document.
  Stream<Set<String>> watchWishlistIds(String uid);

  Future<Either<Failure, void>> addToWishlist(String uid, String productId);

  Future<Either<Failure, void>> removeFromWishlist(String uid, String productId);
}
