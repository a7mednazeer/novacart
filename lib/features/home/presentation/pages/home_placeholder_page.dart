import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';

/// Temporary placeholder so the auth flow is fully testable end-to-end.
/// This gets replaced by the real Home screen (banners, flash sales,
/// categories, recommendations, etc.) in the next build step.
class HomePlaceholderPage extends StatelessWidget {
  const HomePlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('NovaCart')),
        body: BlocListener<AuthCubit, AuthActionState>(
          listener: (context, state) {
            if (state is AuthActionInitial) {
              context.go(AppRoutes.signIn);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: Colors.green, size: 56),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    "You're signed in! 🎉",
                    style: AppTextStyles.h1(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'The full Home screen (banners, flash sales,\ncategories) is next.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium(),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  TextButton.icon(
                    onPressed: () => context.read<AuthCubit>().signOut(),
                    icon: const Icon(Icons.logout_rounded),
                    label: const Text('Sign Out'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
