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
  const SplashReady(this.destination);
  final SplashDestination destination;

  @override
  List<Object?> get props => [destination];
}

class SplashError extends SplashState {
  const SplashError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
