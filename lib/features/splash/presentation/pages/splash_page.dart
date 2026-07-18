import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/gradient_scaffold_background.dart';
import '../cubit/splash_cubit.dart';

/// The very first screen a user sees. Shows the NovaCart brand mark
/// with an elegant entrance animation while [SplashCubit] resolves
/// whether to route to Onboarding, Sign In, or Home.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashCubit>()..checkInitialRoute(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashReady) {
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
        child: const _SplashView(),
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
                'Shop smarter. Arrive faster.',
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
