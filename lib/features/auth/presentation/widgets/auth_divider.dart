import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/l10n/app_localizations.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).dividerColor;

    return Row(
      children: [
        Expanded(child: Divider(color: border)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Text(
            label ?? AppLocalizations.of(context).orContinueWith,
            style: AppTextStyles.bodySmall(color: AppColors.textMutedLight),
          ),
        ),
        Expanded(child: Divider(color: border)),
      ],
    );
  }
}
