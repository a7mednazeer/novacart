import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import 'package:novacart/generated/l10n/app_localizations.dart';
import '../cubit/checkout_cubit.dart';

class CheckoutStepHeader extends StatelessWidget {
  const CheckoutStepHeader({super.key, required this.currentStep});
  final CheckoutStep currentStep;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final steps = [
      (CheckoutStep.address, l10n.stepAddressLabel, Icons.location_on_outlined),
      (CheckoutStep.payment, l10n.stepPaymentLabel, Icons.payment_outlined),
      (CheckoutStep.review, l10n.stepReviewLabel, Icons.receipt_long_outlined),
    ];
    final currentIndex = steps.indexWhere((s) => s.$1 == currentStep);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
      child: Row(
        children: List.generate(steps.length, (index) {
          final (_, label, icon) = steps[index];
          final isActive = index <= currentIndex;
          final isCurrent = index == currentIndex;

          return Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? AppColors.primary : Colors.transparent,
                        border: Border.all(
                          color: isActive
                              ? AppColors.primary
                              : Theme.of(context).dividerColor,
                          width: 1.4,
                        ),
                      ),
                      child: Icon(
                        icon,
                        size: 16,
                        color: isActive ? Colors.white : AppColors.textMutedLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      label,
                      style: AppTextStyles.caption(
                        color: isCurrent
                            ? AppColors.primary
                            : AppColors.textMutedLight,
                      ).copyWith(fontWeight: isCurrent ? FontWeight.w700 : null),
                    ),
                  ],
                ),
                if (index != steps.length - 1)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Divider(
                        color: index < currentIndex
                            ? AppColors.primary
                            : Theme.of(context).dividerColor,
                        thickness: 1.4,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
