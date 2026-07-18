import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// NovaCart's brand mark: a rounded gradient square containing a
/// minimal "route arrow" motif (speed + direction) that resolves into
/// a destination dot — paired with the "NovaCart" wordmark.
///
/// Kept as a single reusable widget (rather than an SVG asset) so the
/// logo scales crisply at any size (splash screen, app bar, onboarding)
/// and its colors can react to light/dark theme automatically.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = 72,
    this.showWordmark = true,
    this.wordmarkColor,
    this.markOnLight = false,
  });

  /// Size of the icon mark (square). Wordmark scales proportionally.
  final double size;
  final bool showWordmark;
  final Color? wordmarkColor;

  /// When the mark sits on a light background, flip its gradient so it
  /// still has enough contrast (used e.g. inside light-themed app bars).
  final bool markOnLight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NovaMark(size: size, onLight: markOnLight),
        if (showWordmark) ...[
          SizedBox(height: size * 0.22),
          Text(
            'NovaCart',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size * 0.34,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              color: wordmarkColor ??
                  (markOnLight ? AppColors.textPrimaryLight : Colors.white),
            ),
          ),
        ],
      ],
    );
  }
}

class _NovaMark extends StatelessWidget {
  const _NovaMark({required this.size, required this.onLight});

  final double size;
  final bool onLight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: onLight
              ? [AppColors.primary, AppColors.primaryLight]
              : [Colors.white, const Color(0xFFDCE8FF)],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: onLight ? 0.35 : 0.25),
            blurRadius: size * 0.25,
            offset: Offset(0, size * 0.08),
          ),
        ],
      ),
      child: CustomPaint(
        painter: _RouteArrowPainter(
          color: onLight ? Colors.white : AppColors.primary,
        ),
      ),
    );
  }
}

/// Paints a minimal chevron "route" path with a destination dot —
/// symbolizing direction, speed and arrival (i.e. fast, reliable
/// delivery).
class _RouteArrowPainter extends CustomPainter {
  _RouteArrowPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.09
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width * 0.30, size.height * 0.32)
      ..lineTo(size.width * 0.30, size.height * 0.62)
      ..lineTo(size.width * 0.58, size.height * 0.62);

    canvas.drawPath(path, paint);

    // Arrow head
    final arrowPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.09
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final arrowPath = Path()
      ..moveTo(size.width * 0.46, size.height * 0.48)
      ..lineTo(size.width * 0.60, size.height * 0.62)
      ..lineTo(size.width * 0.46, size.height * 0.76);

    canvas.drawPath(arrowPath, arrowPaint);

    // Destination dot
    canvas.drawCircle(
      Offset(size.width * 0.70, size.height * 0.34),
      size.width * 0.06,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant _RouteArrowPainter oldDelegate) =>
      oldDelegate.color != color;
}
