import 'package:flutter/material.dart';
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
import '../../../../core/widgets/notification_icon_button.dart';
import '../../../../core/services/push_notification_service.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../notifications/presentation/cubit/notifications_cubit.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../recently_viewed/presentation/cubit/recently_viewed_cubit.dart';
import '../../../wishlist/presentation/cubit/wishlist_cubit.dart';
import '../cubit/home_cubit.dart';
import '../widgets/category_quick_list.dart';
import '../widgets/flash_sale_section.dart';
import '../widgets/home_loading_skeleton.dart';
import '../../../../core/widgets/product_horizontal_list.dart';
import '../widgets/promo_banner_carousel.dart';
import '../widgets/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..load(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  void initState() {
    super.initState();
    // Home is the first screen reached after a successful sign-in, so
    // this is where all app-wide Firestore subscriptions start. Every
    // call here is idempotent — safe even if already started.
    sl<WishlistCubit>().ensureStarted();
    sl<CartCubit>().ensureStarted();
    sl<NotificationsCubit>().ensureStarted();
    sl<PushNotificationService>().saveTokenForCurrentUser();
    sl<RecentlyViewedCubit>().ensureStarted();
  }

  void _toggleFavorite(ProductEntity product) {
    sl<WishlistCubit>().toggle(product.id);
  }

  void _openProduct(ProductEntity product) {
    context.push(AppRoutes.productDetailsPath(product.id));
  }

  void _openCategory(CategoryEntity category) {
    context.push(
      AppRoutes.categoryProducts,
      extra: {'category': category.name},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const HomeLoadingSkeleton();
          }

          if (state is HomeError) {
            return ErrorStateView(
              message: state.message,
              onRetry: () => context.read<HomeCubit>().load(),
            );
          }

          final data = (state as HomeLoaded).data;
          final favoriteIds = context.watch<WishlistCubit>().state.ids;

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () => context.read<HomeCubit>().refresh(),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  child: PromoBannerCarousel(
                    banners: data.banners,
                    onBannerTap: (banner) =>
                        AppSnackBar.showInfo(context, banner.title),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                SectionHeader(
                  title: 'Categories',
                  onViewAll: () => context.go(AppRoutes.categories),
                ),
                const SizedBox(height: AppSpacing.sm),
                CategoryQuickList(
                  categories: data.categories,
                  onCategoryTap: _openCategory,
                ),
                const SizedBox(height: AppSpacing.xl),
                FlashSaleSection(
                  products: data.flashSaleProducts,
                  onProductTap: _openProduct,
                  onFavoriteToggle: _toggleFavorite,
                  favoriteIds: favoriteIds,
                ),
                if (data.flashSaleProducts.isNotEmpty)
                  const SizedBox(height: AppSpacing.xl),
                const SectionHeader(title: '🔥 Best Sellers'),
                const SizedBox(height: AppSpacing.sm),
                ProductHorizontalList(
                  products: data.bestSellers,
                  onProductTap: _openProduct,
                  onFavoriteToggle: _toggleFavorite,
                  favoriteIds: favoriteIds,
                ),
                const SizedBox(height: AppSpacing.xl),
                const SectionHeader(title: '✨ New Arrivals'),
                const SizedBox(height: AppSpacing.sm),
                ProductHorizontalList(
                  products: data.newArrivals,
                  onProductTap: _openProduct,
                  onFavoriteToggle: _toggleFavorite,
                  favoriteIds: favoriteIds,
                ),
                const SizedBox(height: AppSpacing.xl),
                const SectionHeader(title: 'Recommended for You'),
                const SizedBox(height: AppSpacing.sm),
                ProductHorizontalList(
                  products: data.recommended,
                  onProductTap: _openProduct,
                  onFavoriteToggle: _toggleFavorite,
                  favoriteIds: favoriteIds,
                ),
                BlocBuilder<RecentlyViewedCubit, RecentlyViewedState>(
                  bloc: sl<RecentlyViewedCubit>(),
                  builder: (context, recentState) {
                    if (recentState.products.isEmpty) return const SizedBox.shrink();
                    return Column(
                      children: [
                        const SizedBox(height: AppSpacing.xl),
                        const SectionHeader(title: 'Recently Viewed'),
                        const SizedBox(height: AppSpacing.sm),
                        ProductHorizontalList(
                          products: recentState.products,
                          onProductTap: _openProduct,
                          onFavoriteToggle: _toggleFavorite,
                          favoriteIds: favoriteIds,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.xl),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Custom app bar: search field + notifications + cart (with a live
/// item-count badge sourced from the app-wide `CartCubit`).
class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: AppSpacing.lg,
      title: GestureDetector(
        onTap: () => context.push(AppRoutes.search),
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Row(
            children: [
              const Icon(Icons.search_rounded, size: 20, color: AppColors.textMutedLight),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'What do you search for?',
                style: AppTextStyles.bodyMedium(color: AppColors.textMutedLight),
              ),
            ],
          ),
        ),
      ),
      actions: [
        const NotificationIconButton(),
        const CartIconButton(),
        const SizedBox(width: AppSpacing.xs),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

