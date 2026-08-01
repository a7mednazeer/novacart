import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../cart/presentation/widgets/order_summary_card.dart';
import '../cubit/order_details_cubit.dart';
import '../widgets/order_status_timeline.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../../checkout/presentation/utils/payment_method_display.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OrderDetailsCubit>(param1: orderId)..load(),
      child: const _OrderTrackingView(),
    );
  }
}

class _OrderTrackingView extends StatelessWidget {
  const _OrderTrackingView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.orderTrackingTitle)),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          if (state is OrderDetailsLoading) {
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: const [
                ShimmerBox(height: 200),
                SizedBox(height: AppSpacing.lg),
                ShimmerBox(height: 120),
              ],
            );
          }

          if (state is OrderDetailsNotFound) {
            return EmptyStateView(
              icon: Icons.search_off_rounded,
              title: l10n.orderNotFoundTitle,
              message: l10n.orderNotFoundMessage,
              actionLabel: l10n.backToOrdersLabel,
              onAction: () => context.go(AppRoutes.orders),
            );
          }

          if (state is OrderDetailsError) {
            return ErrorStateView(
              message: state.message,
              onRetry: () => context.read<OrderDetailsCubit>().load(),
            );
          }

          final order = (state as OrderDetailsLoaded).order;
          final textPrimary = Theme.of(context).colorScheme.onSurface;

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: OrderStatusTimeline(order: order),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(l10n.itemsWithCountLabel(order.itemCount),
                  style: AppTextStyles.h3(color: textPrimary)),
              const SizedBox(height: AppSpacing.sm),
              ...order.items.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Row(
                      children: [
                        ClipRRect(
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
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodyMedium(color: textPrimary)),
                              Text(l10n.qtyLabel(item.quantity),
                                  style: AppTextStyles.bodySmall(
                                      color: AppColors.textSecondaryLight)),
                            ],
                          ),
                        ),
                        Text('EGP ${item.lineTotal.toStringAsFixed(0)}',
                            style: AppTextStyles.bodyMedium(color: textPrimary)),
                      ],
                    ),
                  )),
              const SizedBox(height: AppSpacing.lg),
              Text(l10n.shippingAddressTitle, style: AppTextStyles.h3(color: textPrimary)),
              const SizedBox(height: 4),
              Text(
                '${order.address.fullName}\n${order.address.phone}\n${order.address.addressLine}, ${order.address.city}',
                style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(l10n.paymentMethodTitle, style: AppTextStyles.h3(color: textPrimary)),
              const SizedBox(height: 4),
              Text(
                paymentMethodLabel(l10n, order.paymentMethod),
                style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
              ),
              const SizedBox(height: AppSpacing.lg),
              OrderSummaryCard(
                subtotal: order.subtotal,
                discountAmount: order.discountAmount,
                shippingFee: order.shippingFee,
                tax: order.tax,
                total: order.total,
                estimatedDelivery: order.estimatedDelivery,
              ),
            ],
          );
        },
      ),
    );
  }
}
