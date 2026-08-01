import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../cubit/onboarding_cubit.dart';
import '../widgets/onboarding_slide.dart';
import '../widgets/onboarding_slide_data.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OnboardingCubit>(),
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingCompleted) {
            context.go(AppRoutes.signIn);
          }
        },
        child: const _OnboardingView(),
      ),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  int _totalSlides = 3;

  bool get _isLastPage => _currentPage == _totalSlides - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_isLastPage) {
      context.read<OnboardingCubit>().complete();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _skip() => context.read<OnboardingCubit>().complete();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final slides = buildOnboardingSlides(context);
    _totalSlides = slides.length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: AppSpacing.lg,
                  top: AppSpacing.sm,
                ),
                child: TextButton(
                  onPressed: _isLastPage ? null : _skip,
                  child: Text(
                    l10n.skip,
                    style: AppTextStyles.buttonMedium(
                      color: _isLastPage
                          ? Colors.transparent
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) => OnboardingSlide(
                  data: slides[index],
                  isActive: index == _currentPage,
                ),
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: slides.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primary,
                dotColor: AppColors.borderLight,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
                spacing: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: AppButton(
                label: _isLastPage ? l10n.onboardingGetStarted : l10n.next,
                onPressed: _next,
                icon: _isLastPage
                    ? null
                    : const Icon(Icons.arrow_forward_rounded,
                        color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
