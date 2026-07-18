part of 'auth_cubit.dart';

sealed class AuthActionState extends Equatable {
  const AuthActionState();

  @override
  List<Object?> get props => [];
}

class AuthActionInitial extends AuthActionState {
  const AuthActionInitial();
}

class AuthActionLoading extends AuthActionState {
  const AuthActionLoading();
}

class AuthActionSuccess extends AuthActionState {
  const AuthActionSuccess([this.user]);
  final UserEntity? user;

  @override
  List<Object?> get props => [user];
}

/// Emitted after [AuthCubit.sendPasswordResetLink] or
/// [AuthCubit.signUp] succeeds where the next step is informational
/// rather than a full navigation (e.g. "check your email").
class AuthActionMessage extends AuthActionState {
  const AuthActionMessage(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class AuthActionFailure extends AuthActionState {
  const AuthActionFailure(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
