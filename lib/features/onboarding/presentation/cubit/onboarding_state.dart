part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

class OnboardingInProgress extends OnboardingState {
  const OnboardingInProgress();
}

class OnboardingCompleted extends OnboardingState {
  const OnboardingCompleted();
}
