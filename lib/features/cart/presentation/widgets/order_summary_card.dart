import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/l10n/app_localizations.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    required this.subtotal,
    required this.discountAmount,
    required this.shippingFee,
    required this.tax,
    required this.total,
    required this.estimatedDelivery,
  });

  final double subtotal;
  final double discountAmount;
  final double shippingFee;
  final double tax;
  final double total;
  final DateTime estimatedDelivery;

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.orderSummary, style: AppTextStyles.h3(color: textPrimary)),
          const SizedBox(height: AppSpacing.md),
          _Row(label: l10n.subtotal, value: subtotal),
          if (discountAmount > 0)
            _Row(label: l10n.discountLabel, value: -discountAmount, valueColor: AppColors.discount),
          _Row(
            label: l10n.shippingLabel,
            value: shippingFee,
            freeLabel: shippingFee == 0,
          ),
          _Row(label: l10n.vatLabel, value: tax),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.totalLabel, style: AppTextStyles.h3(color: textPrimary)),
              Text(
                'EGP ${total.toStringAsFixed(0)}',
                style: AppTextStyles.h2(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              const Icon(Icons.local_shipping_outlined, size: 16, color: AppColors.textSecondaryLight),
              const SizedBox(width: 6),
              Text(
                l10n.estimatedDeliveryLabel(
                  '${_months[estimatedDelivery.month - 1]} ${estimatedDelivery.day}',
                ),
                style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.valueColor,
    this.freeLabel = false,
  });

  final String label;
  final double value;
  final Color? valueColor;
  final bool freeLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight)),
          Text(
            freeLabel
                ? AppLocalizations.of(context).freeLabel
                : '${value < 0 ? '-' : ''}EGP ${value.abs().toStringAsFixed(0)}',
            style: AppTextStyles.bodyMedium(
              color: valueColor ?? Theme.of(context).colorScheme.onSurface,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
