import 'package:flutter/material.dart';

/// NovaCart Design System — Color Palette
///
/// The palette is built around a deep, trustworthy "Nova Blue" paired with
/// clean whites and a warm accent used sparingly for promotions / sales.
/// All colors are exposed as static constants so they can be referenced
/// directly by [AppTheme] and by any widget needing a raw color value
/// (e.g. gradients, shimmer base colors, chart colors).
abstract class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------
  // Brand
  // ---------------------------------------------------------------------
  static const Color primary = Color(0xFF0B3D91); // Nova Blue
  static const Color primaryLight = Color(0xFF3B6FC4);
  static const Color primaryDark = Color(0xFF081B33);

  static const Color secondary = Color(0xFF00C2A8); // Fresh teal accent
  static const Color accent = Color(0xFFFFB020); // Sale / promo amber

  static const List<Color> primaryGradient = [
    Color(0xFF0B3D91),
    Color(0xFF2E5FC9),
  ];

  static const List<Color> splashGradient = [
    Color(0xFF081B33),
    Color(0xFF14509E),
    Color(0xFF3B6FC4),
  ];

  // ---------------------------------------------------------------------
  // Neutrals — Light theme
  // ---------------------------------------------------------------------
  static const Color backgroundLight = Color(0xFFF7F9FC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color borderLight = Color(0xFFE5E9F0);

  static const Color textPrimaryLight = Color(0xFF10192B);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textMutedLight = Color(0xFF9AA3B2);

  // ---------------------------------------------------------------------
  // Neutrals — Dark theme
  // ---------------------------------------------------------------------
  static const Color backgroundDark = Color(0xFF0A0E17);
  static const Color surfaceDark = Color(0xFF131A2A);
  static const Color cardDark = Color(0xFF1A2236);
  static const Color borderDark = Color(0xFF262F45);

  static const Color textPrimaryDark = Color(0xFFF3F5F9);
  static const Color textSecondaryDark = Color(0xFFAEB6C4);
  static const Color textMutedDark = Color(0xFF6E7891);

  // ---------------------------------------------------------------------
  // Semantic
  // ---------------------------------------------------------------------
  static const Color success = Color(0xFF1FAE6B);
  static const Color error = Color(0xFFE0473F);
  static const Color warning = Color(0xFFFFB020);
  static const Color info = Color(0xFF3B82F6);

  static const Color favorite = Color(0xFFE0473F);
  static const Color rating = Color(0xFFFFB020);
  static const Color discount = Color(0xFF1FAE6B);

  // ---------------------------------------------------------------------
  // Overlays / Shadows
  // ---------------------------------------------------------------------
  static const Color shadowLight = Color(0x1A0B3D91);
  static const Color shadowDark = Color(0x33000000);
  static const Color shimmerBaseLight = Color(0xFFE8EBF2);
  static const Color shimmerHighlightLight = Color(0xFFF7F9FC);
  static const Color shimmerBaseDark = Color(0xFF1E2740);
  static const Color shimmerHighlightDark = Color(0xFF2A3552);
}
