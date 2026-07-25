import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class UpdateProfileUseCase {
  const UpdateProfileUseCase(this._repository);
  final AuthRepository _repository;

  Future<Either<Failure, UserEntity>> call({
    required String fullName,
    String? phoneNumber,
  }) {
    return _repository.updateProfile(fullName: fullName, phoneNumber: phoneNumber);
  }
}
