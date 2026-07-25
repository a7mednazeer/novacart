part of 'splash_cubit.dart';

/// Where the splash flow should navigate to once its checks complete.
enum SplashDestination { onboarding, signIn, home }

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashReady extends SplashState {
  const SplashReady(this.destination, {this.requiresBiometric = false});
  final SplashDestination destination;

  /// True when the user has biometric login enabled *and* the
  /// destination is Home (i.e. they have a live Firebase session) —
  /// `SplashPage` shows a Face ID/Touch ID unlock prompt before
  /// actually navigating in that case.
  final bool requiresBiometric;

  @override
  List<Object?> get props => [destination, requiresBiometric];
}

class SplashError extends SplashState {
  const SplashError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
