import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/product_card.dart';
import '../../../../core/widgets/product_filter_sheet.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';
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

class _CategoryProductsView extends StatelessWidget {
  const _CategoryProductsView({required this.title, required this.category});
  final String title;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsLoading) {
            return const _CategoryGridSkeleton();
          }

          if (state is CategoryProductsError) {
            return ErrorStateView(
              message: state.message,
              onRetry: () => context.read<CategoryProductsCubit>().load(category),
            );
          }

          final loaded = state as CategoryProductsLoaded;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${loaded.filteredProducts.length} products',
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
                            ? 'Filters (${loaded.filter.activeCount})'
                            : 'Filter & Sort',
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
                        title: 'No products found',
                        message: 'Try adjusting your filters to see more results.',
                        actionLabel: loaded.filter.isActive ? 'Clear Filters' : null,
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
                                builder: (context, constraints) => ProductCard(
                                  product: product,
                                  width: constraints.maxWidth,
                                  isFavorite: wishlistState.ids.contains(product.id),
                                  onFavoriteToggle: () =>
                                      context.read<WishlistCubit>().toggle(product.id),
                                  onTap: () => context
                                      .push(AppRoutes.productDetailsPath(product.id)),
                                ),
                              );
                            },
                          );
                        },
                      ),
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
