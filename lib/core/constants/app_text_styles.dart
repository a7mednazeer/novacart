import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// NovaCart Design System — Typography Scale
///
/// Built on Poppins for a modern, geometric, premium feel. Every style
/// takes an optional [color] override so the same scale works across
/// light and dark themes without duplicating the whole class.
abstract class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required double size,
    required FontWeight weight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color ?? AppColors.textPrimaryLight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  // Display
  static TextStyle displayLarge({Color? color}) => _base(
        size: 32,
        weight: FontWeight.w700,
        color: color,
        letterSpacing: -0.5,
        height: 1.2,
      );

  static TextStyle displaySmall({Color? color}) => _base(
        size: 26,
        weight: FontWeight.w700,
        color: color,
        letterSpacing: -0.3,
        height: 1.25,
      );

  // Headings
  static TextStyle h1({Color? color}) =>
      _base(size: 24, weight: FontWeight.w600, color: color, height: 1.3);

  static TextStyle h2({Color? color}) =>
      _base(size: 20, weight: FontWeight.w600, color: color, height: 1.3);

  static TextStyle h3({Color? color}) =>
      _base(size: 17, weight: FontWeight.w600, color: color, height: 1.35);

  // Body
  static TextStyle bodyLarge({Color? color}) =>
      _base(size: 16, weight: FontWeight.w400, color: color, height: 1.5);

  static TextStyle bodyMedium({Color? color}) =>
      _base(size: 14, weight: FontWeight.w400, color: color, height: 1.5);

  static TextStyle bodySmall({Color? color}) =>
      _base(size: 12, weight: FontWeight.w400, color: color, height: 1.4);

  // Labels / Buttons
  static TextStyle buttonLarge({Color? color}) => _base(
        size: 16,
        weight: FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.2,
      );

  static TextStyle buttonMedium({Color? color}) => _base(
        size: 14,
        weight: FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.2,
      );

  static TextStyle caption({Color? color}) => _base(
        size: 11,
        weight: FontWeight.w500,
        color: color ?? AppColors.textMutedLight,
        letterSpacing: 0.3,
      );

  static TextStyle overline({Color? color}) => _base(
        size: 11,
        weight: FontWeight.w600,
        color: color,
        letterSpacing: 1.2,
      );
}
