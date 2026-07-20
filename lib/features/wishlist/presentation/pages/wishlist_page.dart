import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/product_card.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../cubit/wishlist_cubit.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();
    sl<WishlistCubit>()
      ..ensureStarted()
      ..loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist'), centerTitle: false),
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

          return RefreshIndicator(
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
                  builder: (context, constraints) => ProductCard(
                    product: product,
                    width: constraints.maxWidth,
                    isFavorite: true,
                    onFavoriteToggle: () => sl<WishlistCubit>().toggle(product.id),
                    onTap: () =>
                        context.push(AppRoutes.productDetailsPath(product.id)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
