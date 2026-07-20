import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/coupon_input.dart';
import '../widgets/order_summary_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    sl<CartCubit>().ensureStarted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartCubit, CartState>(
        bloc: sl<CartCubit>(),
        builder: (context, state) {
          if (state.isLoading) {
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: List.generate(
                3,
                (_) => const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.md),
                  child: ShimmerBox(height: 100),
                ),
              ),
            );
          }

          if (state.isEmpty && state.savedForLater.isEmpty) {
            return EmptyStateView(
              icon: Icons.shopping_cart_outlined,
              title: 'Your cart is empty',
              message: 'Add products to your cart to see them here.',
              actionLabel: 'Start Shopping',
              onAction: () => context.go(AppRoutes.home),
            );
          }

          final cubit = sl<CartCubit>();

          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  children: [
                    if (state.items.isNotEmpty) ...[
                      Text(
                        '${state.itemCount} item${state.itemCount == 1 ? '' : 's'}',
                        style: AppTextStyles.bodyMedium(
                          color: AppColors.textSecondaryLight,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ...state.items.map(
                        (line) => CartItemCard(
                          line: line,
                          onIncrement: () => cubit.incrementQuantity(line.productId),
                          onDecrement: () => cubit.decrementQuantity(line.productId),
                          onRemove: () => cubit.removeItem(line.productId),
                          onSaveForLater: () => cubit.saveForLater(line.productId),
                        ),
                      ),
                    ] else
                      const EmptyStateView(
                        icon: Icons.shopping_cart_outlined,
                        title: 'Cart is empty',
                        message: 'Move items back from Saved for Later, or keep shopping.',
                      ),
                    if (state.savedForLater.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'Saved for Later (${state.savedForLater.length})',
                        style: AppTextStyles.h3(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ...state.savedForLater.map(
                        (line) => CartItemCard(
                          line: line,
                          isSavedForLater: true,
                          onIncrement: () {},
                          onDecrement: () {},
                          onRemove: () => cubit.removeItem(line.productId),
                          onMoveToCart: () => cubit.moveToCart(line.productId),
                        ),
                      ),
                    ],
                    if (state.items.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.lg),
                      CouponInput(
                        appliedCode: state.couponCode,
                        onApply: cubit.applyCoupon,
                        onRemove: cubit.removeCoupon,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      OrderSummaryCard(
                        subtotal: state.subtotal,
                        discountAmount: state.discountAmount,
                        shippingFee: state.shippingFee,
                        tax: state.tax,
                        total: state.total,
                        estimatedDelivery: state.estimatedDelivery,
                      ),
                    ],
                  ],
                ),
              ),
              if (state.items.isNotEmpty)
                _CheckoutBar(total: state.total, onCheckout: () {
                  context.push(AppRoutes.checkout);
                }),
            ],
          );
        },
      ),
    );
  }
}

class _CheckoutBar extends StatelessWidget {
  const _CheckoutBar({required this.total, required this.onCheckout});
  final double total;
  final VoidCallback onCheckout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        MediaQuery.of(context).padding.bottom + AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: ElevatedButton(
          onPressed: onCheckout,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Checkout · EGP ${total.toStringAsFixed(0)}'),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_rounded, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
