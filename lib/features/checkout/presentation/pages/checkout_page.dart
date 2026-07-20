import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/widgets/order_summary_card.dart';
import '../../domain/entities/payment_method.dart';
import '../cubit/checkout_cubit.dart';
import '../widgets/add_address_sheet.dart';
import '../widgets/address_card.dart';
import '../widgets/checkout_step_header.dart';
import '../widgets/payment_method_tile.dart';
// import 'order_confirmation_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CheckoutCubit>()..loadAddresses(),
      child: const _CheckoutView(),
    );
  }
}

class _CheckoutView extends StatelessWidget {
  const _CheckoutView();

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            AppSnackBar.showError(context, state.errorMessage!);
          }
          if (state.placedOrder != null) {
            context.read<CartCubit>().clearCart();
            context.pushReplacement(
              AppRoutes.orderConfirmation,
              extra: state.placedOrder,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<CheckoutCubit>();

          return Column(
            children: [
              CheckoutStepHeader(currentStep: state.step),
              const Divider(height: 1),
              Expanded(
                child: switch (state.step) {
                  CheckoutStep.address => _AddressStep(state: state, cubit: cubit),
                  CheckoutStep.payment => _PaymentStep(state: state, cubit: cubit),
                  CheckoutStep.review => _ReviewStep(
                      checkoutState: state,
                      cartState: cartState,
                      cubit: cubit,
                    ),
                },
              ),
              _BottomBar(state: state, cubit: cubit),
            ],
          );
        },
      ),
    );
  }
}

class _AddressStep extends StatelessWidget {
  const _AddressStep({required this.state, required this.cubit});
  final CheckoutState state;
  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (state.isLoadingAddresses) {
      return ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: List.generate(
          2,
          (_) => const Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.sm),
            child: ShimmerBox(height: 90),
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Text(
          'Select a shipping address',
          style: AppTextStyles.h3(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: AppSpacing.md),
        ...state.addresses.map(
          (address) => AddressCard(
            address: address,
            isSelected: address.id == state.selectedAddressId,
            onTap: () => cubit.selectAddress(address.id),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        OutlinedButton.icon(
          onPressed: () => showAddAddressSheet(
            context,
            onSubmit: ({
              required fullName,
              required phone,
              required addressLine,
              required city,
            }) =>
                cubit.addAddress(
              fullName: fullName,
              phone: phone,
              addressLine: addressLine,
              city: city,
            ),
          ),
          icon: const Icon(Icons.add_rounded, size: 18),
          label: const Text('Add New Address'),
        ),
      ],
    );
  }
}

class _PaymentStep extends StatelessWidget {
  const _PaymentStep({required this.state, required this.cubit});
  final CheckoutState state;
  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Text(
          'Select a payment method',
          style: AppTextStyles.h3(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: AppSpacing.md),
        ...PaymentMethodType.values.map(
          (method) => PaymentMethodTile(
            method: method,
            isSelected: method == state.paymentMethod,
            onTap: () => cubit.selectPaymentMethod(method),
          ),
        ),
        if (state.paymentMethod != PaymentMethodType.cashOnDelivery) ...[
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.info.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded, size: 18, color: AppColors.info),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'This is a demo checkout — no real payment will be charged.',
                    style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _ReviewStep extends StatelessWidget {
  const _ReviewStep({
    required this.checkoutState,
    required this.cartState,
    required this.cubit,
  });

  final CheckoutState checkoutState;
  final CartState cartState;
  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;
    final address = checkoutState.selectedAddress;

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Text('${cartState.itemCount} item${cartState.itemCount == 1 ? '' : 's'}',
            style: AppTextStyles.h3(color: textPrimary)),
        const SizedBox(height: AppSpacing.sm),
        ...cartState.items.map((line) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${line.product.name} × ${line.quantity}',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
                    ),
                  ),
                  Text(
                    'EGP ${line.lineTotal.toStringAsFixed(0)}',
                    style: AppTextStyles.bodyMedium(color: textPrimary),
                  ),
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.lg),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping to', style: AppTextStyles.h3(color: textPrimary)),
            TextButton(
              onPressed: () => cubit.goToStep(CheckoutStep.address),
              child: const Text('Change'),
            ),
          ],
        ),
        if (address != null)
          Text(
            '${address.fullName}\n${address.phone}\n${address.addressLine}, ${address.city}',
            style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
          ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Payment', style: AppTextStyles.h3(color: textPrimary)),
            TextButton(
              onPressed: () => cubit.goToStep(CheckoutStep.payment),
              child: const Text('Change'),
            ),
          ],
        ),
        Text(
          checkoutState.paymentMethod.label,
          style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
        ),
        const SizedBox(height: AppSpacing.lg),
        OrderSummaryCard(
          subtotal: cartState.subtotal,
          discountAmount: cartState.discountAmount,
          shippingFee: cartState.shippingFee,
          tax: cartState.tax,
          total: cartState.total,
          estimatedDelivery: cartState.estimatedDelivery,
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.state, required this.cubit});
  final CheckoutState state;
  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg, AppSpacing.sm, AppSpacing.lg,
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
        child: Row(
          children: [
            if (state.step != CheckoutStep.address)
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: OutlinedButton(
                  onPressed: cubit.previousStep,
                  child: const Text('Back'),
                ),
              ),
            Expanded(
              child: AppButton(
                label: state.step == CheckoutStep.review
                    ? 'Place Order · EGP ${cartState.total.toStringAsFixed(0)}'
                    : 'Continue',
                isLoading: state.isPlacingOrder,
                onPressed: state.step == CheckoutStep.address && !state.canProceedFromAddress
                    ? null
                    : () {
                        if (state.step == CheckoutStep.review) {
                          cubit.placeOrder(
                            cartItems: cartState.items,
                            subtotal: cartState.subtotal,
                            discountAmount: cartState.discountAmount,
                            shippingFee: cartState.shippingFee,
                            tax: cartState.tax,
                            total: cartState.total,
                            estimatedDelivery: cartState.estimatedDelivery,
                            couponCode: cartState.couponCode,
                          );
                        } else {
                          cubit.nextStep();
                        }
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
