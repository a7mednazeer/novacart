import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';

/// The full Profile screen (edit info, addresses, payment methods,
/// order history, notifications, language) is a later build step.
/// This version is already functional for the two things that matter
/// most right now: signing out, and toggling dark mode — both fully
/// wired, not stubs.
class ProfilePlaceholderPage extends StatelessWidget {
  const ProfilePlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthActionState>(
        listener: (context, state) {
          if (state is AuthActionInitial) {
            context.go(AppRoutes.signIn);
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Profile')),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.person_rounded, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your NovaCart Account',
                            style: AppTextStyles.h3(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Manage your orders, addresses & settings',
                            style: AppTextStyles.bodySmall(
                              color: AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              BlocBuilder<ThemeCubit, ThemeMode>(
                bloc: sl<ThemeCubit>(),
                builder: (context, mode) {
                  return SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    activeColor: AppColors.primary,
                    title: Text(
                      'Dark Mode',
                      style: AppTextStyles.bodyLarge(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    secondary: const Icon(Icons.dark_mode_outlined),
                    value: mode == ThemeMode.dark,
                    onChanged: (_) => sl<ThemeCubit>().toggle(),
                  );
                },
              ),
              const Divider(height: AppSpacing.xxl),
              _MenuTile(
                icon: Icons.receipt_long_outlined,
                label: 'Order History',
                onTap: () => context.push(AppRoutes.orders),
              ),
              _MenuTile(
                icon: Icons.location_on_outlined,
                label: 'Saved Addresses',
                onTap: () => context.push(AppRoutes.manageAddresses),
              ),
              _MenuTile(
                icon: Icons.payment_outlined,
                label: 'Payment Methods',
                onTap: () => AppSnackBar.showInfo(context, 'Payment Methods — coming soon'),
              ),
              _MenuTile(
                icon: Icons.help_outline_rounded,
                label: 'Help Center',
                onTap: () => AppSnackBar.showInfo(context, 'Help Center — coming soon'),
              ),
              const SizedBox(height: AppSpacing.xxl),
              BlocBuilder<AuthCubit, AuthActionState>(
                builder: (context, state) {
                  return AppButton(
                    label: 'Sign Out',
                    variant: AppButtonVariant.outlined,
                    isLoading: state is AuthActionLoading,
                    icon: const Icon(Icons.logout_rounded, size: 18, color: AppColors.primary),
                    onPressed: () => context.read<AuthCubit>().signOut(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.textSecondaryLight),
      title: Text(
        label,
        style: AppTextStyles.bodyLarge(color: Theme.of(context).colorScheme.onSurface),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.textMutedLight),
      onTap: onTap,
    );
  }
}
