/// NovaCart Design System — Spacing & Radius scale.
///
/// Using a consistent 4pt-based spacing scale keeps every screen visually
/// aligned. Never hardcode raw padding/margin numbers in feature widgets —
/// always reference [AppSpacing] / [AppRadius] so the whole app can be
/// re-tuned from one place.
abstract class AppSpacing {
  AppSpacing._();

  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

abstract class AppRadius {
  AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double pill = 999;
}

abstract class AppDurations {
  AppDurations._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration splash = Duration(milliseconds: 2200);
}

abstract class AppElevation {
  AppElevation._();

  static const double card = 2;
  static const double button = 1;
  static const double modal = 8;
}
