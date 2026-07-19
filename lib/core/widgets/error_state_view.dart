import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../constants/app_text_styles.dart';
import 'app_button.dart';

/// A single "something went wrong" view with a retry action, reused
/// anywhere a Cubit emits an error state instead of each screen
/// building its own bespoke error UI.
class ErrorStateView extends StatelessWidget {
  const ErrorStateView({
    super.key,
    required this.message,
    required this.onRetry,
    this.icon = Icons.cloud_off_rounded,
  });

  final String message;
  final VoidCallback onRetry;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: AppColors.textMutedLight),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Something went wrong',
              style: AppTextStyles.h2(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
            ),
            const SizedBox(height: AppSpacing.xl),
            AppButton(label: 'Try Again', onPressed: onRetry, fullWidth: false),
          ],
        ),
      ),
    );
  }
}
