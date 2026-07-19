import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/home_data.dart';
import '../repositories/home_repository.dart';

class GetHomeDataUseCase {
  const GetHomeDataUseCase(this._repository);
  final HomeRepository _repository;

  Future<Either<Failure, HomeData>> call() => _repository.getHomeData();
}
