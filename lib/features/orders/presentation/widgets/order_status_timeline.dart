import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../checkout/domain/entities/order_entity.dart';

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

  static const _stages = [
    (OrderStatus.processing, Icons.receipt_long_rounded, 'Order Processing', 'We\'ve received your order'),
    (OrderStatus.shipped, Icons.inventory_2_rounded, 'Shipped', 'Your order has left our warehouse'),
    (OrderStatus.outForDelivery, Icons.local_shipping_rounded, 'Out for Delivery', 'Your order is on its way'),
    (OrderStatus.delivered, Icons.home_rounded, 'Delivered', 'Enjoy your order!'),
  ];

  @override
  Widget build(BuildContext context) {
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
            Text('This order was cancelled.',
                style: AppTextStyles.bodyMedium(color: AppColors.error)),
          ],
        ),
      );
    }

    final currentStage = _simulatedStageIndex(order);
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Column(
      children: List.generate(_stages.length, (index) {
        final (_, icon, title, subtitle) = _stages[index];
        final isComplete = index <= currentStage;
        final isLast = index == _stages.length - 1;

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
