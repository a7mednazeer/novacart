import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../domain/entities/order_entity.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../utils/payment_method_display.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key, required this.order});
  final OrderEntity order;

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_rounded, color: Colors.white, size: 52),
                )
                    .animate()
                    .scale(
                      begin: const Offset(0.6, 0.6),
                      end: const Offset(1, 1),
                      duration: 450.ms,
                      curve: Curves.easeOutBack,
                    )
                    .fadeIn(duration: 300.ms),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  l10n.orderPlacedTitle,
                  style: AppTextStyles.displaySmall(color: textPrimary),
                ).animate().fadeIn(delay: 200.ms),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.orderConfirmedMessage(
                    order.id.isNotEmpty ? order.id.substring(0, 8).toUpperCase() : 'NOVA',
                  ),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
                ).animate().fadeIn(delay: 300.ms),
                const SizedBox(height: AppSpacing.xl),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: Column(
                    children: [
                      _SummaryRow(
                        label: l10n.itemsLabel,
                        value: '${order.itemCount}',
                      ),
                      _SummaryRow(
                        label: l10n.stepPaymentLabel,
                        value: paymentMethodLabel(l10n, order.paymentMethod),
                      ),
                      _SummaryRow(
                        label: l10n.estimatedDeliveryTitle,
                        value:
                            '${_months[order.estimatedDelivery.month - 1]} ${order.estimatedDelivery.day}',
                      ),
                      const Divider(height: AppSpacing.lg),
                      _SummaryRow(
                        label: l10n.totalPaidLabel,
                        value: 'EGP ${order.total.toStringAsFixed(0)}',
                        emphasize: true,
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0),
                const Spacer(),
                AppButton(
                  label: l10n.continueShoppingLabel,
                  onPressed: () => context.go(AppRoutes.home),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppButton(
                  label: l10n.viewOrderLabel,
                  variant: AppButtonVariant.text,
                  onPressed: () =>
                      context.push(AppRoutes.orderTrackingPath(order.id)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value, this.emphasize = false});
  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight)),
          Text(
            value,
            style: (emphasize ? AppTextStyles.h3(color: AppColors.primary) : AppTextStyles.bodyMedium(color: textPrimary))
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
