import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/categories/presentation/pages/category_products_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/profile_placeholder_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/wishlist/presentation/pages/wishlist_placeholder_page.dart';
import '../widgets/scaffold_with_nav_bar.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Central navigation graph for NovaCart.
///
/// Splash/Onboarding/Auth are plain top-level [GoRoute]s (no bottom
/// nav). Home/Categories/Wishlist/Profile live inside a
/// [StatefulShellRoute.indexedStack] so each tab keeps its own
/// navigation stack and the bottom nav bar persists across them — the
/// standard pattern for an e-commerce app's main shell. Cart, Checkout,
/// Product Details, and Search will be pushed as full-screen routes
/// *on top of* the shell (registered at the top level, same as Auth)
/// as each is built.
abstract class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        name: AppRoutes.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.home,
              name: AppRoutes.home,
              builder: (context, state) => const HomePage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.categories,
              name: AppRoutes.categories,
              builder: (context, state) => const CategoriesPage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.wishlist,
              name: AppRoutes.wishlist,
              builder: (context, state) => const WishlistPlaceholderPage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.profile,
              name: AppRoutes.profile,
              builder: (context, state) => const ProfilePlaceholderPage(),
            ),
          ]),
        ],
      ),

      GoRoute(
        path: AppRoutes.search,
        name: AppRoutes.search,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: AppRoutes.categoryProducts,
        name: AppRoutes.categoryProducts,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return CategoryProductsPage(
            category: extra['category'] as String? ?? '',
            subcategoryName: extra['subcategoryName'] as String?,
          );
        },
      ),

      // Upcoming top-level routes (pushed on top of the shell, added as
      // each screen is built): AppRoutes.productDetails, AppRoutes.cart,
      // AppRoutes.checkout, AppRoutes.orders, ...
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.uri.path}'),
      ),
    ),
  );
}
