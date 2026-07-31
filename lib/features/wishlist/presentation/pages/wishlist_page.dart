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
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/product_card.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../comparison/presentation/cubit/comparison_cubit.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../cubit/wishlist_cubit.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool _isCompareMode = false;

  @override
  void initState() {
    super.initState();
    sl<WishlistCubit>()
      ..ensureStarted()
      ..loadProducts();
  }

  void _toggleCompareMode() {
    setState(() => _isCompareMode = !_isCompareMode);
  }

  void _handleCompareToggle(ProductEntity product) {
    final added = sl<ComparisonCubit>().toggle(product);
    if (!added) {
      AppSnackBar.showInfo(
        context,
        'You can compare up to ${ComparisonCubit.maxProducts} products at a time.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.compare_arrows_rounded,
              color: _isCompareMode ? AppColors.primary : null,
            ),
            tooltip: 'Compare products',
            onPressed: _toggleCompareMode,
          ),
        ],
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        bloc: sl<WishlistCubit>(),
        builder: (context, state) {
          if (state.isLoadingProducts && state.products == null) {
            return GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.lg,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) => const ShimmerBox(height: 260),
            );
          }

          final products = state.products ?? const [];

          if (products.isEmpty) {
            return EmptyStateView(
              icon: Icons.favorite_border_rounded,
              title: 'Your wishlist is empty',
              message: 'Tap the heart on any product to save it here for later.',
              actionLabel: 'Browse Products',
              onAction: () => context.go(AppRoutes.home),
            );
          }

          return Column(
            children: [
              if (_isCompareMode)
                Container(
                  width: double.infinity,
                  color: AppColors.primary.withValues(alpha: 0.08),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded,
                          size: 16, color: AppColors.primary),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(
                        child: Text(
                          'Select 2-${ComparisonCubit.maxProducts} products to compare',
                          style: AppTextStyles.bodySmall(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => sl<WishlistCubit>().loadProducts(),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppSpacing.lg,
                      crossAxisSpacing: AppSpacing.md,
                      childAspectRatio: 0.62,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return LayoutBuilder(
                        builder: (context, constraints) => Stack(
                          children: [
                            ProductCard(
                              product: product,
                              width: constraints.maxWidth,
                              isFavorite: true,
                              onFavoriteToggle: _isCompareMode
                                  ? null
                                  : () => sl<WishlistCubit>().toggle(product.id),
                              onTap: _isCompareMode
                                  ? () => _handleCompareToggle(product)
                                  : () => context.push(
                                      AppRoutes.productDetailsPath(product.id)),
                            ),
                            if (_isCompareMode)
                              Positioned(
                                top: 8,
                                left: 8,
                                child: BlocBuilder<ComparisonCubit,
                                    ComparisonState>(
                                  bloc: sl<ComparisonCubit>(),
                                  builder: (context, compareState) {
                                    final selected =
                                        compareState.contains(product.id);
                                    return Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: selected
                                            ? AppColors.primary
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: selected
                                              ? AppColors.primary
                                              : AppColors.textMutedLight,
                                        ),
                                      ),
                                      child: selected
                                          ? const Icon(Icons.check_rounded,
                                              size: 16, color: Colors.white)
                                          : null,
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (_isCompareMode)
                BlocBuilder<ComparisonCubit, ComparisonState>(
                  bloc: sl<ComparisonCubit>(),
                  builder: (context, compareState) {
                    if (compareState.products.isEmpty) {
                      return const SizedBox.shrink();
                    }
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
                        child: AppButton(
                          label: compareState.canCompare
                              ? 'Compare (${compareState.products.length})'
                              : 'Select at least 2 to compare',
                          onPressed: compareState.canCompare
                              ? () => context.push(AppRoutes.comparison)
                              : null,
                          icon: const Icon(Icons.compare_arrows_rounded,
                              size: 18, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
