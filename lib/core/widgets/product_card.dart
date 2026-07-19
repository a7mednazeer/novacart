import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../features/product/domain/entities/product_entity.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../constants/app_text_styles.dart';
import 'shimmer_box.dart';

/// The single product card used across the whole catalog surface
/// (Home sections, Categories grid, Search results, Wishlist). Keeping
/// one implementation means a visual tweak (e.g. badge style) never
/// has to be repeated in four places.
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.onFavoriteToggle,
    this.isFavorite = false,
    this.width = 168,
  });

  final ProductEntity product;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteToggle;
  final bool isFavorite;
  final double width;

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'product-image-${product.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const ShimmerBox(
                          borderRadius: 0,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: AppColors.shimmerBaseLight,
                          child: const Icon(Icons.image_not_supported_outlined,
                              color: AppColors.textMutedLight),
                        ),
                      ),
                    ),
                  ),
                ),
                if (product.hasDiscount)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: _Badge(
                      label: '-${product.discountPercent}%',
                      color: AppColors.discount,
                    ),
                  ),
                if (product.isNew && !product.hasDiscount)
                  const Positioned(
                    top: 8,
                    left: 8,
                    child: _Badge(label: 'NEW', color: AppColors.info),
                  ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        size: 16,
                        color: isFavorite ? AppColors.favorite : AppColors.textMutedLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              product.brand.toUpperCase(),
              style: AppTextStyles.overline(color: AppColors.textMutedLight),
            ),
            const SizedBox(height: 2),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyMedium(color: textPrimary)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star_rounded, size: 14, color: AppColors.rating),
                const SizedBox(width: 2),
                Text(
                  product.rating.toStringAsFixed(1),
                  style: AppTextStyles.caption(color: AppColors.textSecondaryLight),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'EGP ${product.discountedPrice.toStringAsFixed(0)}',
                  style: AppTextStyles.h3(color: AppColors.primary),
                ),
                if (product.hasDiscount) ...[
                  const SizedBox(width: 6),
                  Text(
                    'EGP ${product.price.toStringAsFixed(0)}',
                    style: AppTextStyles.bodySmall(
                      color: AppColors.textMutedLight,
                    ).copyWith(decoration: TextDecoration.lineThrough),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption(color: Colors.white)
            .copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
