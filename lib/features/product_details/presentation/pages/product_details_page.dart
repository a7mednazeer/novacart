import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/cart_icon_button.dart';
import '../../../../core/widgets/product_horizontal_list.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';
import '../cubit/product_details_cubit.dart';
import '../widgets/add_to_cart_bar.dart';
import '../widgets/color_selector.dart';
import '../widgets/expandable_description.dart';
import '../widgets/product_image_gallery.dart';
import '../widgets/rating_reviews_section.dart';
import '../widgets/shipping_and_specs_section.dart';
import '../widgets/size_selector.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductDetailsCubit>()..load(productId),
      child: _ProductDetailsView(productId: productId),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  const _ProductDetailsView({required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const _DetailsSkeleton();
          }

          if (state is ProductDetailsError) {
            return SafeArea(
              child: Column(
                children: [
                  AppBar(title: const Text('Product Details')),
                  Expanded(
                    child: ErrorStateView(
                      message: state.message,
                      onRetry: () =>
                          context.read<ProductDetailsCubit>().load(productId),
                    ),
                  ),
                ],
              ),
            );
          }

          final loaded = state as ProductDetailsLoaded;
          final product = loaded.data.product;
          final textPrimary = Theme.of(context).colorScheme.onSurface;

          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    surfaceTintColor: Colors.transparent,
                    title: const Text('Product Details'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        onPressed: () => AppSnackBar.showInfo(
                          context,
                          'Sharing ${product.name}…',
                        ),
                      ),
                      const CartIconButton(),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ProductImageGallery(
                                images: product.images.isNotEmpty
                                    ? product.images
                                    : [product.imageUrl],
                                heroTag: 'product-image-${product.id}',
                              ),
                              Positioned(
                                top: AppSpacing.sm,
                                right: AppSpacing.sm,
                                child: BlocBuilder<WishlistCubit, WishlistState>(
                                  builder: (context, wishlistState) {
                                    final isFavorite =
                                        wishlistState.ids.contains(product.id);
                                    return _FavoriteButton(
                                      isFavorite: isFavorite,
                                      onTap: () {
                                        context.read<WishlistCubit>().toggle(product.id);
                                        AppSnackBar.showSuccess(
                                          context,
                                          isFavorite
                                              ? 'Removed from wishlist'
                                              : 'Added to wishlist',
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            product.brand.toUpperCase(),
                            style: AppTextStyles.overline(color: AppColors.primary),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: AppTextStyles.h1(color: textPrimary),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'EGP ${product.discountedPrice.toStringAsFixed(0)}',
                                    style: AppTextStyles.h1(color: AppColors.primary),
                                  ),
                                  if (product.hasDiscount)
                                    Text(
                                      'EGP ${product.price.toStringAsFixed(0)}',
                                      style: AppTextStyles.bodySmall(
                                        color: AppColors.textMutedLight,
                                      ).copyWith(decoration: TextDecoration.lineThrough),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: [
                              Icon(Icons.star_rounded, size: 16, color: AppColors.rating),
                              const SizedBox(width: 4),
                              Text(
                                '${product.rating} (${product.reviewCount})',
                                style: AppTextStyles.bodySmall(
                                  color: AppColors.textSecondaryLight,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Icon(Icons.local_fire_department_rounded,
                                  size: 16, color: AppColors.accent),
                              const SizedBox(width: 4),
                              Text(
                                '${product.soldCount} sold',
                                style: AppTextStyles.bodySmall(
                                  color: AppColors.textSecondaryLight,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text('Description', style: AppTextStyles.h3(color: textPrimary)),
                          const SizedBox(height: 6),
                          ExpandableDescription(
                            text: product.description.isNotEmpty
                                ? product.description
                                : 'No description available for this product yet.',
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          SizeSelector(
                            sizes: product.sizes,
                            selectedSize: loaded.selectedSize,
                            onSelect: (size) =>
                                context.read<ProductDetailsCubit>().selectSize(size),
                          ),
                          if (product.sizes.isNotEmpty)
                            const SizedBox(height: AppSpacing.lg),
                          ColorSelector(
                            colors: product.colors,
                            selectedColor: loaded.selectedColor,
                            onSelect: (color) =>
                                context.read<ProductDetailsCubit>().selectColor(color),
                          ),
                          if (product.colors.isNotEmpty)
                            const SizedBox(height: AppSpacing.xl),
                          const Divider(),
                          const SizedBox(height: AppSpacing.lg),
                          ShippingAndSpecsSection(product: product),
                          const SizedBox(height: AppSpacing.xl),
                          const Divider(),
                          const SizedBox(height: AppSpacing.lg),
                          RatingReviewsSection(
                            product: product,
                            reviews: loaded.data.reviews,
                            ratingBreakdown: loaded.data.ratingBreakdown,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (loaded.data.similarProducts.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                              child: Text(
                                'You Might Also Like',
                                style: AppTextStyles.h2(color: textPrimary),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            BlocBuilder<WishlistCubit, WishlistState>(
                              builder: (context, wishlistState) {
                                return ProductHorizontalList(
                                  products: loaded.data.similarProducts,
                                  onProductTap: (p) => _navigateToProduct(context, p),
                                  onFavoriteToggle: (p) =>
                                      context.read<WishlistCubit>().toggle(p.id),
                                  favoriteIds: wishlistState.ids,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: AddToCartBar(
                  totalPrice: loaded.totalPrice,
                  quantity: loaded.quantity,
                  onIncrement: () =>
                      context.read<ProductDetailsCubit>().incrementQuantity(),
                  onDecrement: () =>
                      context.read<ProductDetailsCubit>().decrementQuantity(),
                  onAddToCart: () {
                    context.read<CartCubit>().addItem(
                          product,
                          color: loaded.selectedColor,
                          size: loaded.selectedSize,
                          quantity: loaded.quantity,
                        );
                    AppSnackBar.showSuccess(
                      context,
                      'Added ${loaded.quantity}× ${product.name} to cart',
                    );
                  },
                )
                    .animate(target: 1)
                    .fadeIn(duration: 250.ms)
                    .slideY(begin: 0.15, end: 0, curve: Curves.easeOut),
              ),
            ],
          );
        },
      ),
    );
  }

  void _navigateToProduct(BuildContext context, ProductEntity product) {
    // Pushing the same route replaces the "You Might Also Like" item's
    // details on top of the current one, building a natural back-stack
    // of browsed products — standard e-commerce drill-down behavior.
    context.push(AppRoutes.productDetailsPath(product.id));
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.isFavorite, required this.onTap});
  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          size: 20,
          color: isFavorite ? AppColors.favorite : AppColors.textMutedLight,
        ),
      ),
    );
  }
}

class _DetailsSkeleton extends StatelessWidget {
  const _DetailsSkeleton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerBox(height: 340, borderRadius: AppRadius.lg),
            const SizedBox(height: AppSpacing.lg),
            const ShimmerBox(width: 120, height: 16),
            const SizedBox(height: AppSpacing.sm),
            const ShimmerBox(width: 220, height: 24),
            const SizedBox(height: AppSpacing.md),
            const ShimmerBox(height: 60),
          ],
        ),
      ),
    );
  }
}
