import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../product/domain/entities/product_entity.dart';

class ShippingAndSpecsSection extends StatelessWidget {
  const ShippingAndSpecsSection({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final estimatedDelivery = DateTime.now().add(const Duration(days: 4));
    final formatted = '${_month(estimatedDelivery.month)} ${estimatedDelivery.day}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoTile(
          icon: Icons.local_shipping_outlined,
          title: 'Estimated delivery',
          subtitle: 'Arrives by $formatted if ordered today',
        ),
        _InfoTile(
          icon: Icons.replay_rounded,
          title: 'Free returns',
          subtitle: '30-day return window, no questions asked',
        ),
        _InfoTile(
          icon: Icons.verified_user_outlined,
          title: 'Secure checkout',
          subtitle: 'Cash on delivery, cards, and digital wallets accepted',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Specifications',
          style: AppTextStyles.h3(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(height: AppSpacing.sm),
        _SpecRow(label: 'Brand', value: product.brand),
        _SpecRow(label: 'Category', value: product.category),
        if (product.colors.isNotEmpty)
          _SpecRow(label: 'Available Colors', value: '${product.colors.length} options'),
        if (product.sizes.isNotEmpty)
          _SpecRow(label: 'Available Sizes', value: product.sizes.join(', ')),
        _SpecRow(label: 'Units Sold', value: '${product.soldCount}+'),
      ],
    );
  }

  String _month(int m) => const [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ][m - 1];
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyMedium(color: textPrimary)
                    .copyWith(fontWeight: FontWeight.w600)),
                Text(subtitle, style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  const _SpecRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight)),
          Text(
            value,
            style: AppTextStyles.bodyMedium(color: Theme.of(context).colorScheme.onSurface)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
