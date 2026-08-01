import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../checkout/domain/entities/order_entity.dart';
import 'package:novacart/generated/l10n/app_localizations.dart';
import '../../../checkout/presentation/utils/order_status_display.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order, required this.onTap});

  final OrderEntity order;
  final VoidCallback onTap;

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  Color _statusColor(OrderStatus status) => switch (status) {
        OrderStatus.processing => AppColors.info,
        OrderStatus.shipped => AppColors.accent,
        OrderStatus.outForDelivery => AppColors.accent,
        OrderStatus.delivered => AppColors.success,
        OrderStatus.cancelled => AppColors.error,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;
    final date = order.createdAt;
    final statusColor = _statusColor(order.status);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.orderNumberLabel(
                    order.id.length >= 8 ? order.id.substring(0, 8).toUpperCase() : order.id.toUpperCase(),
                  ),
                  style: AppTextStyles.bodyMedium(color: textPrimary)
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    orderStatusLabel(l10n, order.status),
                    style: AppTextStyles.caption(color: statusColor)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              l10n.dateWithItemCount(
                '${_months[date.month - 1]} ${date.day}, ${date.year}',
                l10n.itemCount(order.itemCount),
              ),
              style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: 52,
              child: Row(
                children: [
                  ...order.items.take(4).map((item) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          child: CachedNetworkImage(
                            imageUrl: item.imageUrl,
                            width: 52,
                            height: 52,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const ShimmerBox(width: 52, height: 52, borderRadius: 0),
                          ),
                        ),
                      )),
                  if (order.items.length > 4)
                    Container(
                      width: 52,
                      height: 52,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.shimmerBaseLight,
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                      child: Text(
                        l10n.moreItemsCount(order.items.length - 4),
                        style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.totalLabel,
                  style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
                ),
                Text(
                  'EGP ${order.total.toStringAsFixed(0)}',
                  style: AppTextStyles.h3(color: AppColors.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
