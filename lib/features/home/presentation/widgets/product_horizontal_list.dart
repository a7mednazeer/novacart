import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/widgets/product_card.dart';
import '../../../product/domain/entities/product_entity.dart';

class ProductHorizontalList extends StatelessWidget {
  const ProductHorizontalList({
    super.key,
    required this.products,
    required this.onProductTap,
    this.onFavoriteToggle,
    this.favoriteIds = const {},
  });

  final List<ProductEntity> products;
  final ValueChanged<ProductEntity> onProductTap;
  final ValueChanged<ProductEntity>? onFavoriteToggle;
  final Set<String> favoriteIds;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 264,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            isFavorite: favoriteIds.contains(product.id),
            onTap: () => onProductTap(product),
            onFavoriteToggle: onFavoriteToggle == null
                ? null
                : () => onFavoriteToggle!(product),
          );
        },
      ),
    );
  }
}
