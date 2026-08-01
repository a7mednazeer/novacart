import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/services/biometric_auth_service.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/gradient_scaffold_background.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import 'package:novacart/generated/l10n/app_localizations.dart';
import '../cubit/splash_cubit.dart';

/// The very first screen a user sees. Shows the NovaCart brand mark
/// with an elegant entrance animation while [SplashCubit] resolves
/// whether to route to Onboarding, Sign In, or Home — and, if the user
/// has enabled biometric login, gates Home behind a Face ID/Touch ID
/// prompt first.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashCubit>()..checkInitialRoute(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashReady && !state.requiresBiometric) {
            switch (state.destination) {
              case SplashDestination.onboarding:
                context.go(AppRoutes.onboarding);
                break;
              case SplashDestination.signIn:
                context.go(AppRoutes.signIn);
                break;
              case SplashDestination.home:
                context.go(AppRoutes.home);
                break;
            }
          } else if (state is SplashError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is SplashReady && state.requiresBiometric) {
            return const _BiometricLockView();
          }
          return const _SplashView();
        },
      ),
    );
  }
}

/// Shown instead of auto-navigating to Home when biometric login is
/// enabled. Prompts immediately on first build; offers a retry and a
/// "Sign in with password instead" fallback (which signs out of the
/// live Firebase session and returns to Sign In) in case biometrics
/// fail or aren't available right now.
class _BiometricLockView extends StatefulWidget {
  const _BiometricLockView();

  @override
  State<_BiometricLockView> createState() => _BiometricLockViewState();
}

class _BiometricLockViewState extends State<_BiometricLockView> {
  bool _isAuthenticating = false;
  bool _lastAttemptFailed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _attemptUnlock());
  }

  Future<void> _attemptUnlock() async {
    setState(() {
      _isAuthenticating = true;
      _lastAttemptFailed = false;
    });

    final success = await sl<BiometricAuthService>().authenticate(
      reason: AppLocalizations.of(context).unlockNovaCartTitle,
    );

    if (!mounted) return;
    setState(() => _isAuthenticating = false);

    if (success) {
      context.go(AppRoutes.home);
    } else {
      setState(() => _lastAttemptFailed = true);
    }
  }

  Future<void> _signInWithPasswordInstead() async {
    await sl<AuthCubit>().signOut();
    if (mounted) context.go(AppRoutes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: GradientScaffoldBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const Spacer(flex: 3),
                const AppLogo(size: 72),
                const Spacer(flex: 1),
                Icon(
                  Icons.fingerprint_rounded,
                  size: 72,
                  color: Colors.white.withValues(alpha: _isAuthenticating ? 1 : 0.85),
                ),
                const SizedBox(height: 16),
                Text(
                  _isAuthenticating
                      ? l10n.waitingForAuthMessage
                      : _lastAttemptFailed
                          ? l10n.couldntVerifyMessage
                          : l10n.unlockNovaCartTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.useFaceIdMessage,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium(
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
                const Spacer(flex: 2),
                if (_lastAttemptFailed && !_isAuthenticating) ...[
                  AppButton(label: l10n.retry, onPressed: _attemptUnlock),
                  const SizedBox(height: 12),
                ],
                AppButton(
                  label: l10n.signInWithPasswordInstead,
                  variant: AppButtonVariant.text,
                  onPressed: _isAuthenticating ? null : _signInWithPasswordInstead,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientScaffoldBackground(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              const AppLogo(size: 96)
                  .animate()
                  .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                  .scale(
                    begin: const Offset(0.85, 0.85),
                    end: const Offset(1, 1),
                    duration: 600.ms,
                    curve: Curves.easeOutBack,
                  ),
              const SizedBox(height: 14),
              Text(
                AppLocalizations.of(context).splashTagline,
                style: AppTextStyles.bodyMedium(
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
              const Spacer(flex: 4),
              _LoadingDots(),
              const SizedBox(height: 12),
              Text(
                'v1.0.0',
                style: AppTextStyles.caption(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
          ),
        ),
      ),
    );
  }
}

/// A minimal, premium three-dot pulse loader instead of a generic
/// spinner — reinforces brand color and feels intentional rather than
/// a default framework widget.
class _LoadingDots extends StatelessWidget {
  const _LoadingDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          )
              .animate(onPlay: (controller) => controller.repeat())
              .fadeIn(duration: 400.ms, delay: (index * 150).ms)
              .then()
              .fadeOut(duration: 400.ms),
        );
      }),
    );
  }
}
