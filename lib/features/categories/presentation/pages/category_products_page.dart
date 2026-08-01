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
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/product_card.dart';
import '../../../../core/widgets/product_filter_sheet.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../comparison/presentation/cubit/comparison_cubit.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../cubit/category_products_cubit.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({
    super.key,
    required this.category,
    this.subcategoryName,
  });

  final String category;

  /// NOTE: mock/Firestore products don't carry a subcategory tag yet
  /// (see `product_mock_data.dart`); this is passed through so the
  /// header/title reflects the user's tap, and becomes a real filter
  /// the moment `ProductEntity`/Firestore documents gain a
  /// `subcategory` field.
  final String? subcategoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CategoryProductsCubit>()..load(category),
      child: _CategoryProductsView(
        title: subcategoryName ?? category,
        category: category,
      ),
    );
  }
}

class _CategoryProductsView extends StatefulWidget {
  const _CategoryProductsView({required this.title, required this.category});
  final String title;
  final String category;

  @override
  State<_CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<_CategoryProductsView> {
  bool _isCompareMode = false;

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
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.compare_arrows_rounded,
              color: _isCompareMode ? AppColors.primary : null,
            ),
            tooltip: l10n.compareProductsTooltip,
            onPressed: _toggleCompareMode,
          ),
        ],
      ),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsLoading) {
            return const _CategoryGridSkeleton();
          }

          if (state is CategoryProductsError) {
            return ErrorStateView(
              message: state.message,
              onRetry: () => context.read<CategoryProductsCubit>().load(widget.category),
            );
          }

          final loaded = state as CategoryProductsLoaded;

          return Column(
            children: [
              if (_isCompareMode)
                Container(
                  width: double.infinity,
                  color: AppColors.primary.withValues(alpha: 0.08),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg, vertical: AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, size: 16, color: AppColors.primary),
                      const SizedBox(width: AppSpacing.xs),
                      Expanded(
                        child: Text(
                          l10n.selectToCompare(ComparisonCubit.maxProducts),
                          style: AppTextStyles.bodySmall(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.productsCountLabel(loaded.filteredProducts.length),
                      style: AppTextStyles.bodyMedium(
                        color: AppColors.textSecondaryLight,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final result = await showProductFilterSheet(
                          context,
                          current: loaded.filter,
                          availableBrands: loaded.availableBrands,
                          catalogMaxPrice: loaded.maxPrice,
                        );
                        if (result != null && context.mounted) {
                          context.read<CategoryProductsCubit>().applyFilter(result);
                        }
                      },
                      icon: const Icon(Icons.tune_rounded, size: 18),
                      label: Text(
                        loaded.filter.isActive
                            ? l10n.filtersCount(loaded.filter.activeCount)
                            : l10n.filterAndSort,
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 38),
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: loaded.filteredProducts.isEmpty
                    ? EmptyStateView(
                        icon: Icons.search_off_rounded,
                        title: l10n.noProductsFoundTitle,
                        message: l10n.tryAdjustingFiltersMessage,
                        actionLabel: loaded.filter.isActive ? l10n.clearFiltersLabel : null,
                        onAction: loaded.filter.isActive
                            ? () => context.read<CategoryProductsCubit>().clearFilter()
                            : null,
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.xl,
                        ),
                        itemCount: loaded.filteredProducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppSpacing.lg,
                          crossAxisSpacing: AppSpacing.md,
                          childAspectRatio: 0.62,
                        ),
                        itemBuilder: (context, index) {
                          final product = loaded.filteredProducts[index];
                          return BlocBuilder<WishlistCubit, WishlistState>(
                            builder: (context, wishlistState) {
                              return LayoutBuilder(
                                builder: (context, constraints) => Stack(
                                  children: [
                                    ProductCard(
                                      product: product,
                                      width: constraints.maxWidth,
                                      isFavorite: wishlistState.ids.contains(product.id),
                                      onFavoriteToggle: _isCompareMode
                                          ? null
                                          : () => context
                                              .read<WishlistCubit>()
                                              .toggle(product.id),
                                      onTap: _isCompareMode
                                          ? () => _handleCompareToggle(product)
                                          : () => context.push(
                                              AppRoutes.productDetailsPath(product.id)),
                                    ),
                                    if (_isCompareMode)
                                      Positioned(
                                        top: 8,
                                        left: 8,
                                        child: BlocBuilder<ComparisonCubit, ComparisonState>(
                                          bloc: sl<ComparisonCubit>(),
                                          builder: (context, compareState) {
                                            final selected = compareState.contains(product.id);
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
                          );
                        },
                      ),
              ),
              if (_isCompareMode)
                BlocBuilder<ComparisonCubit, ComparisonState>(
                  bloc: sl<ComparisonCubit>(),
                  builder: (context, compareState) {
                    if (compareState.products.isEmpty) return const SizedBox.shrink();
                    return Container(
                      padding: EdgeInsets.fromLTRB(
                        AppSpacing.lg, AppSpacing.sm, AppSpacing.lg,
                        MediaQuery.of(context).padding.bottom + AppSpacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 12, offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: SafeArea(
                        top: false,
                        child: AppButton(
                          label: compareState.canCompare
                              ? l10n.compareProductsWithCount(compareState.products.length)
                              : l10n.selectAtLeastTwoToCompare,
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

class _CategoryGridSkeleton extends StatelessWidget {
  const _CategoryGridSkeleton();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.lg,
        crossAxisSpacing: AppSpacing.md,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) => const ShimmerBox(height: 260),
    );
  }
}
