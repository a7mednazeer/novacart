import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

/// Central navigation graph for NovaCart.
///
/// Built with GoRouter for declarative, deep-link-friendly navigation.
/// Each feature contributes its own routes here as it's implemented —
/// right now only [AppRoutes.splash] exists; Onboarding/Auth/Home routes
/// will be appended in the following steps without touching this file's
/// overall structure.
abstract class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
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
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Onboarding (Coming Soon)')),
        ),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        name: AppRoutes.signIn,
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Sign In (Coming Soon)')),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Home (Coming Soon)')),
        ),
      ),

      // Upcoming routes (added as each screen is built):
      // AppRoutes.onboarding, AppRoutes.signIn, AppRoutes.signUp,
      // AppRoutes.home, AppRoutes.categories, AppRoutes.cart, ...
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.uri.path}'),
      ),
    ),
  );
}
