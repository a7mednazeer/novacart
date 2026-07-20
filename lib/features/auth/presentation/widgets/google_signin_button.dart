import 'package:flutter/material.dart';
// import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';

/// A Google sign-in button. The multi-color "G" is drawn from stacked
/// [CustomPaint] arcs rather than requiring a bundled SVG, so the auth
/// screen renders correctly out of the box — swap in Google's official
/// SVG asset (`assets/icons/ic_google.svg`) later for pixel-perfect
/// brand compliance if desired.
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).dividerColor;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: border),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2.2),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _GoogleMark(size: 20),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Continue with Google',
                    style: AppTextStyles.buttonMedium(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _GoogleMark extends StatelessWidget {
  const _GoogleMark({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _GoogleGPainter()),
    );
  }
}

class _GoogleGPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final strokeWidth = size.width * 0.22;

    void drawArc(double startDegrees, double sweepDegrees, Color color) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;
      canvas.drawArc(
        rect.deflate(strokeWidth / 2),
        startDegrees * 3.1415926535 / 180,
        sweepDegrees * 3.1415926535 / 180,
        false,
        paint,
      );
    }

    drawArc(-45, 90, const Color(0xFF4285F4)); // blue
    drawArc(45, 90, const Color(0xFF34A853)); // green
    drawArc(135, 90, const Color(0xFFFBBC05)); // yellow
    drawArc(225, 90, const Color(0xFFEA4335)); // red

    // Horizontal bar of the "G"
    final barPaint = Paint()..color = const Color(0xFF4285F4);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.52,
        size.height * 0.44,
        size.width * 0.42,
        size.height * 0.16,
      ),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _GoogleGPainter oldDelegate) => false;
}
