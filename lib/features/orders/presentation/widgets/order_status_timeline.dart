import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../../checkout/domain/entities/order_entity.dart';
import '../../../checkout/presentation/utils/order_status_display.dart';

/// ============================================================================
/// DEMO SIMULATION — REPLACE WITH REAL STATUS UPDATES
/// ============================================================================
/// NovaCart never writes anything to Firestore beyond `processing` today
/// (there's no courier/webhook integration in this scaffold), so this
/// derives a plausible progress stage purely from elapsed time between
/// `createdAt` and `estimatedDelivery`, for demo purposes only.
///
/// In production: a Cloud Function (triggered by your courier/logistics
/// webhook) would update the order document's real `status` field
/// directly, and this widget would simply render `order.status` — delete
/// this function and the four `_stageIndex`/`_estimatedStageTime` calls
/// below once that's wired up.
/// ============================================================================
int _simulatedStageIndex(OrderEntity order) {
  if (order.status == OrderStatus.cancelled) return -1;

  final totalDuration = order.estimatedDelivery.difference(order.createdAt);
  final elapsed = DateTime.now().difference(order.createdAt);
  if (totalDuration.inSeconds <= 0) return 0;

  final progress = (elapsed.inSeconds / totalDuration.inSeconds).clamp(0.0, 1.0);
  if (progress >= 1.0) return 3;
  if (progress >= 0.66) return 2;
  if (progress >= 0.25) return 1;
  return 0;
}

class OrderStatusTimeline extends StatelessWidget {
  const OrderStatusTimeline({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (order.status == OrderStatus.cancelled) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Row(
          children: [
            const Icon(Icons.cancel_outlined, color: AppColors.error),
            const SizedBox(width: AppSpacing.sm),
            Text(l10n.orderCancelledMessage,
                style: AppTextStyles.bodyMedium(color: AppColors.error)),
          ],
        ),
      );
    }

    final stages = [
      (OrderStatus.processing, Icons.receipt_long_rounded, l10n.stageProcessingTitle, l10n.stageProcessingSubtitle),
      (OrderStatus.shipped, Icons.inventory_2_rounded, orderStatusLabel(l10n, OrderStatus.shipped), l10n.stageShippedSubtitle),
      (OrderStatus.outForDelivery, Icons.local_shipping_rounded, orderStatusLabel(l10n, OrderStatus.outForDelivery), l10n.stageOutForDeliverySubtitle),
      (OrderStatus.delivered, Icons.home_rounded, orderStatusLabel(l10n, OrderStatus.delivered), l10n.stageDeliveredSubtitle),
    ];

    final currentStage = _simulatedStageIndex(order);
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Column(
      children: List.generate(stages.length, (index) {
        final (_, icon, title, subtitle) = stages[index];
        final isComplete = index <= currentStage;
        final isLast = index == stages.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isComplete ? AppColors.primary : Colors.transparent,
                      border: Border.all(
                        color: isComplete ? AppColors.primary : Theme.of(context).dividerColor,
                        width: 1.4,
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: 18,
                      color: isComplete ? Colors.white : AppColors.textMutedLight,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: index < currentStage
                            ? AppColors.primary
                            : Theme.of(context).dividerColor,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.bodyMedium(
                          color: isComplete ? textPrimary : AppColors.textMutedLight,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        subtitle,
                        style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
