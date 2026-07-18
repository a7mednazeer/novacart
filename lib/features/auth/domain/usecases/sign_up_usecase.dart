import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  const SignUpUseCase(this._repository);
  final AuthRepository _repository;

  Future<Either<Failure, UserEntity>> call({
    required String fullName,
    required String email,
    required String password,
  }) {
    return _repository.signUp(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
