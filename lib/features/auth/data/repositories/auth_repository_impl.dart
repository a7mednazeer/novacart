import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Concrete [AuthRepository]. This is the boundary where Firebase
/// exceptions get translated into domain [Failure]s with messages
/// that are safe and friendly to show directly in the UI.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) => _guard(() => _remoteDataSource.signIn(email: email, password: password));

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String fullName,
    required String email,
    required String password,
  }) => _guard(() => _remoteDataSource.signUp(
        fullName: fullName,
        email: email,
        password: password,
      ));

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() =>
      _guard(() => _remoteDataSource.signInWithGoogle());

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) =>
      _guard(() => _remoteDataSource.sendPasswordResetEmail(email));

  @override
  Future<Either<Failure, void>> sendEmailVerification() =>
      _guard(() => _remoteDataSource.sendEmailVerification());

  @override
  Future<Either<Failure, void>> signOut() =>
      _guard(() => _remoteDataSource.signOut());

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() =>
      _guard(() => _remoteDataSource.getCurrentUser());

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String fullName,
    String? phoneNumber,
  }) =>
      _guard(() => _remoteDataSource.updateProfile(
            fullName: fullName,
            phoneNumber: phoneNumber,
          ));

  /// Runs [action], catching Firebase and generic exceptions and
  /// converting them into an `Either<Failure, T>` so nothing above the
  /// data layer ever has to deal with a thrown exception directly.
  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } on fb.FirebaseAuthException catch (e) {
      return Left(AuthFailure(_messageForCode(e.code)));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  String _messageForCode(String code) {
    switch (code) {
      case 'invalid-email':
        return 'That email address looks invalid.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'user-not-found':
        return 'No account found with that email.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Incorrect email or password.';
      case 'email-already-in-use':
        return 'An account already exists with that email.';
      case 'weak-password':
        return 'Please choose a stronger password.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again shortly.';
      case 'network-request-failed':
        return 'No internet connection. Please check your network.';
      case 'sign-in-cancelled':
        return 'Sign-in was cancelled.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}
