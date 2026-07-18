import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/forgot_password_usecase.dart';
import '../../domain/usecases/google_sign_in_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

part 'auth_state.dart';

/// One cubit reused by Sign In, Sign Up, and Forgot Password screens.
/// Each screen mounts its own instance (via `sl<AuthCubit>()` — a
/// factory registration) and calls the single method relevant to it,
/// so there's no shared mutable state leaking between unrelated forms.
class AuthCubit extends Cubit<AuthActionState> {
  AuthCubit({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required GoogleSignInUseCase googleSignInUseCase,
    required SignOutUseCase signOutUseCase,
    required LocalStorageService localStorage,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _forgotPasswordUseCase = forgotPasswordUseCase,
        _googleSignInUseCase = googleSignInUseCase,
        _signOutUseCase = signOutUseCase,
        _localStorage = localStorage,
        super(const AuthActionInitial());

  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final SignOutUseCase _signOutUseCase;
  final LocalStorageService _localStorage;

  Future<void> signIn({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    emit(const AuthActionLoading());
    final result = await _signInUseCase(email: email, password: password);

    result.fold(
      (failure) => emit(AuthActionFailure(failure.message)),
      (user) async {
        await _localStorage.setRememberMe(rememberMe);
        emit(AuthActionSuccess(user));
      },
    );
  }

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(const AuthActionLoading());
    final result = await _signUpUseCase(
      fullName: fullName,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(AuthActionFailure(failure.message)),
      (user) => emit(const AuthActionMessage(
        "Account created! We've sent a verification link to your email.",
      )),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthActionLoading());
    final result = await _googleSignInUseCase();

    result.fold(
      (failure) => emit(AuthActionFailure(failure.message)),
      (user) => emit(AuthActionSuccess(user)),
    );
  }

  Future<void> sendPasswordResetLink(String email) async {
    emit(const AuthActionLoading());
    final result = await _forgotPasswordUseCase(email);

    result.fold(
      (failure) => emit(AuthActionFailure(failure.message)),
      (_) => emit(AuthActionMessage(
        'A password reset link has been sent to $email.',
      )),
    );
  }

  Future<void> signOut() async {
    emit(const AuthActionLoading());
    final result = await _signOutUseCase();

    result.fold(
      (failure) => emit(AuthActionFailure(failure.message)),
      (_) async {
        await _localStorage.clearSession();
        emit(const AuthActionInitial());
      },
    );
  }
}
