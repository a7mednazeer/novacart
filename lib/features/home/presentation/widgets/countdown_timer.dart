import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

/// A self-contained ticking countdown ("HH:MM:SS") toward [endTime].
/// Owns its own [Timer] and disposes it correctly — sections using
/// this just pass an end time and never think about ticking again.
class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key, required this.endTime, this.onEnded});

  final DateTime endTime;
  final VoidCallback? onEnded;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration _remaining = widget.endTime.difference(DateTime.now());
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final remaining = widget.endTime.difference(DateTime.now());
      if (remaining.isNegative) {
        _timer?.cancel();
        widget.onEnded?.call();
      }
      if (mounted) setState(() => _remaining = remaining);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final isEnded = _remaining.isNegative;
    final h = isEnded ? 0 : _remaining.inHours;
    final m = isEnded ? 0 : _remaining.inMinutes % 60;
    final s = isEnded ? 0 : _remaining.inSeconds % 60;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.timer_outlined, size: 15, color: AppColors.accent),
        const SizedBox(width: 4),
        Text(
          isEnded ? "Sale ended" : '${_two(h)}:${_two(m)}:${_two(s)}',
          style: AppTextStyles.bodySmall(color: AppColors.accent)
              .copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
