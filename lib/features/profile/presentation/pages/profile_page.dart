import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/services/biometric_auth_service.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import 'about_feedback_page.dart';
import 'edit_profile_page.dart';
import 'help_center_page.dart';
import 'language_settings_page.dart';
import 'static_content_page.dart';

/// The main Profile tab: account card (tap to edit), appearance/language
/// settings, order & address management, support/legal, and sign out.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const EditProfilePage()),
                ),
                child: Container(
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
                              'Tap to edit your name & phone number',
                              style: AppTextStyles.bodySmall(
                                color: AppColors.textSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded, color: AppColors.textMutedLight),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              BlocBuilder<ThemeCubit, ThemeMode>(
                bloc: sl<ThemeCubit>(),
                builder: (context, mode) {
                  return SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    activeThumbColor: AppColors.primary,
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
              _MenuTile(
                icon: Icons.language_rounded,
                label: 'Language',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LanguageSettingsPage()),
                ),
              ),
              const _BiometricLoginToggle(),
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
                onTap: () => _showComingSoon(context, 'Payment Methods'),
              ),
              const Divider(height: AppSpacing.xxl),
              _MenuTile(
                icon: Icons.help_outline_rounded,
                label: 'Help Center',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const HelpCenterPage()),
                ),
              ),
              _MenuTile(
                icon: Icons.privacy_tip_outlined,
                label: 'Privacy Policy',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StaticContentPage(
                      title: 'Privacy Policy',
                      sections: privacyPolicySections,
                    ),
                  ),
                ),
              ),
              _MenuTile(
                icon: Icons.description_outlined,
                label: 'Terms & Conditions',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const StaticContentPage(
                      title: 'Terms & Conditions',
                      sections: termsAndConditionsSections,
                    ),
                  ),
                ),
              ),
              _MenuTile(
                icon: Icons.info_outline_rounded,
                label: 'About & Feedback',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AboutFeedbackPage()),
                ),
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

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature — coming soon')),
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

/// Only rendered if the device actually supports biometrics (checked
/// once on mount) — no point showing a toggle that can never work.
/// Enabling requires one successful authentication up front, so the
/// user isn't locked out of their own account by a setting they
/// couldn't actually complete at Splash time.
class _BiometricLoginToggle extends StatefulWidget {
  const _BiometricLoginToggle();

  @override
  State<_BiometricLoginToggle> createState() => _BiometricLoginToggleState();
}

class _BiometricLoginToggleState extends State<_BiometricLoginToggle> {
  bool _isSupported = false;
  bool _isChecking = true;
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkSupport();
  }

  Future<void> _checkSupport() async {
    final supported = await sl<BiometricAuthService>().isDeviceSupported();
    if (!mounted) return;
    setState(() {
      _isSupported = supported;
      _isEnabled = sl<LocalStorageService>().biometricEnabled;
      _isChecking = false;
    });
  }

  Future<void> _onToggle(bool value) async {
    if (value) {
      final confirmed = await sl<BiometricAuthService>().authenticate(
        reason: 'Confirm to enable biometric login',
      );
      if (!confirmed) return;
    }

    await sl<LocalStorageService>().setBiometricEnabled(value);
    if (mounted) setState(() => _isEnabled = value);
  }

  @override
  Widget build(BuildContext context) {
    if (_isChecking || !_isSupported) return const SizedBox.shrink();

    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      activeThumbColor: AppColors.primary,
      title: Text(
        'Biometric Login',
        style: AppTextStyles.bodyLarge(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        'Require Face ID / Touch ID to open the app',
        style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
      ),
      secondary: const Icon(Icons.fingerprint_rounded),
      value: _isEnabled,
      onChanged: _onToggle,
    );
  }
}
