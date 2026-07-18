import 'package:equatable/equatable.dart';

/// Base class for all domain-layer failures.
///
/// Repositories return `Either<Failure, T>` (via `dartz`) instead of
/// throwing raw exceptions, so the presentation layer can pattern-match
/// on failure type and show the right UI (retry button, snackbar, etc.)
/// without ever depending on Firebase/Dio exception types directly.
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Something went wrong on our end.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure(
      [super.message = 'No internet connection. Please check your network.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Could not load local data.']);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
