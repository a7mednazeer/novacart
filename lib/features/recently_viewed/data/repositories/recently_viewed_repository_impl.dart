import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/recently_viewed_repository.dart';
import '../datasources/recently_viewed_remote_datasource.dart';

class RecentlyViewedRepositoryImpl implements RecentlyViewedRepository {
  RecentlyViewedRepositoryImpl(this._dataSource);
  final RecentlyViewedRemoteDataSource _dataSource;

  @override
  Stream<List<String>> watchRecentlyViewedIds(String uid) {
    return _dataSource.watchRecentlyViewedIds(uid).handleError((_) => <String>[]);
  }

  @override
  Future<Either<Failure, void>> recordView(String uid, String productId) async {
    try {
      await _dataSource.recordView(uid, productId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
