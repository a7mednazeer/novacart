import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class RecentlyViewedRepository {
  /// Ordered (most-recent-first) stream of viewed product ids, capped
  /// server-side to the most recent N — order matters here (unlike
  /// Wishlist's plain `Set<String>`), so this returns a `List`.
  Stream<List<String>> watchRecentlyViewedIds(String uid);

  Future<Either<Failure, void>> recordView(String uid, String productId);
}
