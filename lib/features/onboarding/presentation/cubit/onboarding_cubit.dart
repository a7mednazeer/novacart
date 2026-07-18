import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/local_storage_service.dart';

part 'onboarding_state.dart';

/// Handles the one piece of business logic Onboarding actually has:
/// persisting that the user has seen it, so [SplashCubit] never routes
/// back here again. Slide position itself is pure presentation state
/// (owned by the `PageController` in the widget) and doesn't belong in
/// a Cubit.
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._localStorage) : super(const OnboardingInProgress());

  final LocalStorageService _localStorage;

  Future<void> complete() async {
    await _localStorage.setHasSeenOnboarding(true);
    emit(const OnboardingCompleted());
  }
}
