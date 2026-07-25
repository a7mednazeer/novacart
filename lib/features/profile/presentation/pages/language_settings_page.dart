import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/theme/language_cubit.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  static const _languages = [
    ('en', 'English'),
    ('ar', 'العربية (Arabic)'),
  ];

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              ..._languages.map((lang) {
                final (code, label) = lang;
                final isSelected = locale.languageCode == code;

                return Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Theme.of(context).dividerColor,
                      width: isSelected ? 1.6 : 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(label, style: AppTextStyles.bodyLarge(color: textPrimary)),
                    trailing: Icon(
                      isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                      color: isSelected ? AppColors.primary : AppColors.textMutedLight,
                    ),
                    onTap: () => context.read<LanguageCubit>().setLanguage(code),
                  ),
                );
              }),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Layout direction updates instantly. Full Arabic text translation '
                'is coming in a future update.',
                style: AppTextStyles.bodySmall(color: AppColors.textMutedLight),
              ),
            ],
          );
        },
      ),
    );
  }
}
