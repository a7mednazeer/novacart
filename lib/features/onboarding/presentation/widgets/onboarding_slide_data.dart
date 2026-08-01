import 'package:flutter/material.dart';
import '../../../../generated/l10n/app_localizations.dart';

/// Content for one onboarding slide. Using simple Material icons inside
/// a decorated container (rather than requiring illustration assets
/// upfront) keeps the app fully runnable before custom artwork exists —
/// swap `icon` for an `Image.asset`/SVG per slide later without
/// touching the page layout.
class OnboardingSlideData {
  const OnboardingSlideData({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}

/// A function rather than a top-level `const` list because the titles
/// and descriptions are now localized (`AppLocalizations` needs a
/// `BuildContext`) — called once from `OnboardingPage.build()`.
List<OnboardingSlideData> buildOnboardingSlides(BuildContext context) {
  final l10n = AppLocalizations.of(context);

  return [
    OnboardingSlideData(
      icon: Icons.storefront_rounded,
      title: l10n.onboarding1Title,
      description: l10n.onboarding1Desc,
    ),
    OnboardingSlideData(
      icon: Icons.local_shipping_rounded,
      title: l10n.onboarding2Title,
      description: l10n.onboarding2Desc,
    ),
    OnboardingSlideData(
      icon: Icons.verified_user_rounded,
      title: l10n.onboarding3Title,
      description: l10n.onboarding3Desc,
    ),
  ];
}

