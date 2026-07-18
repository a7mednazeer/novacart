import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/services/local_storage_service.dart';

part 'splash_state.dart';

/// Decides where the app should land after the splash animation:
///
/// 1. First launch ever              → [SplashDestination.onboarding]
/// 2. Onboarding seen, not signed in  → [SplashDestination.signIn]
/// 3. Onboarding seen, signed in      → [SplashDestination.home]
///
/// The minimum splash duration ([AppDurations.splash]) is enforced even
/// if the checks resolve instantly, so the brand animation never feels
/// like a jarring flash.
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._localStorage) : super(const SplashInitial());

  final LocalStorageService _localStorage;

  Future<void> checkInitialRoute() async {
    emit(const SplashLoading());

    try {
      final results = await Future.wait([
        _resolveDestination(),
        Future.delayed(AppDurations.splash),
      ]);

      final destination = results.first as SplashDestination;
      emit(SplashReady(destination));
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }

  Future<SplashDestination> _resolveDestination() async {
    if (!_localStorage.hasSeenOnboarding) {
      return SplashDestination.onboarding;
    }

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      return SplashDestination.home;
    }

    return SplashDestination.signIn;
  }
}
