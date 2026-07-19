import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/widgets/app_button.dart';
import 'quantity_selector.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({
    super.key,
    required this.totalPrice,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAddToCart,
    this.isInStock = true,
  });

  final double totalPrice;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToCart;
  final bool isInStock;

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
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            QuantitySelector(
              quantity: quantity,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: AppButton(
                label: isInStock
                    ? 'Add to Cart · EGP ${totalPrice.toStringAsFixed(0)}'
                    : 'Out of Stock',
                icon: isInStock
                    ? const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 18)
                    : null,
                onPressed: isInStock ? onAddToCart : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
