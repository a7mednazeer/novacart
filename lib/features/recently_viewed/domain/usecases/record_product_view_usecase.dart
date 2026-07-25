import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/recently_viewed_repository.dart';

class RecordProductViewUseCase {
  const RecordProductViewUseCase(this._repository);
  final RecentlyViewedRepository _repository;

  Future<Either<Failure, void>> call(String uid, String productId) {
    return _repository.recordView(uid, productId);
  }
}
