import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../cubit/order_history_cubit.dart';
import '../widgets/order_card.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OrderHistoryCubit>()..loadOrders(),
      child: const _OrderHistoryView(),
    );
  }
}

class _OrderHistoryView extends StatelessWidget {
  const _OrderHistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order History')),
      body: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
        builder: (context, state) {
          if (state is OrderHistoryLoading) {
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: List.generate(
                3,
                (_) => const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.md),
                  child: ShimmerBox(height: 150),
                ),
              ),
            );
          }

          if (state is OrderHistoryError) {
            return ErrorStateView(
              message: state.message,
              onRetry: () => context.read<OrderHistoryCubit>().loadOrders(),
            );
          }

          final orders = (state as OrderHistoryLoaded).orders;

          if (orders.isEmpty) {
            return EmptyStateView(
              icon: Icons.receipt_long_outlined,
              title: 'No orders yet',
              message: 'Your past orders will show up here once you place one.',
              actionLabel: 'Start Shopping',
              onAction: () => context.go(AppRoutes.home),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: orders
                .map((order) => OrderCard(
                      order: order,
                      onTap: () =>
                          context.push(AppRoutes.orderTrackingPath(order.id)),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
