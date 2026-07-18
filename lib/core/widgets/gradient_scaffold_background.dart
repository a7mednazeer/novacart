import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// A full-bleed diagonal gradient background, used by the Splash screen
/// and reused later by auth screens for brand consistency.
class GradientScaffoldBackground extends StatelessWidget {
  const GradientScaffoldBackground({
    super.key,
    required this.child,
    this.colors = AppColors.splashGradient,
  });

  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}
