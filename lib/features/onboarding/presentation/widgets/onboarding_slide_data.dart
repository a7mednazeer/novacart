import 'package:flutter/material.dart';

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

const List<OnboardingSlideData> onboardingSlides = [
  OnboardingSlideData(
    icon: Icons.storefront_rounded,
    title: 'Shop Everything,\nAll in One Place',
    description:
        'Explore thousands of curated products across fashion, tech, home '
        'and more — all from one seamless app.',
  ),
  OnboardingSlideData(
    icon: Icons.local_shipping_rounded,
    title: 'Fast, Trackable\nDelivery',
    description:
        'Get real-time order tracking and reliable delivery estimates, '
        'right from checkout to your doorstep.',
  ),
  OnboardingSlideData(
    icon: Icons.verified_user_rounded,
    title: 'Secure & Trusted\nCheckout',
    description:
        'Pay your way with bank-grade security — cards, wallets, or cash '
        'on delivery, your choice, every time.',
  ),
];
