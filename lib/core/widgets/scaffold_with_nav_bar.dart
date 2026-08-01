import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novacart/generated/l10n/app_localizations.dart';
import '../constants/app_colors.dart';

/// The persistent bottom-nav shell used by [StatefulShellRoute]. Each
/// tab keeps its own independent navigation stack (via
/// [StatefulNavigationShell]), so switching tabs preserves scroll
/// position and any pushed sub-routes instead of resetting each time —
/// standard e-commerce app behavior (e.g. leaving a product detail
/// page mid-scroll on the Categories tab and coming back to it later).
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      // Tapping the already-active tab pops it back to its root
      // instead of doing nothing — matches platform convention.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        backgroundColor: Theme.of(context).colorScheme.surface,
        indicatorColor: AppColors.primary.withValues(alpha: 0.10),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded, color: AppColors.primary),
            label: l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.grid_view_outlined),
            selectedIcon: const Icon(Icons.grid_view_rounded, color: AppColors.primary),
            label: l10n.navCategories,
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_border_rounded),
            selectedIcon: const Icon(Icons.favorite_rounded, color: AppColors.primary),
            label: l10n.navWishlist,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline_rounded),
            selectedIcon: const Icon(Icons.person_rounded, color: AppColors.primary),
            label: l10n.navProfile,
          ),
        ],
      ),
    );
  }
}
