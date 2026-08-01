import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/theme/language_cubit.dart';
import '../../../../generated/l10n/app_localizations.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  /// Groups language metadata: (code, emoji, nativeName, localizedName)
  static const _languages = [
    ('en', '🇺🇸', 'English', 'English'),
    ('ar', '🇪🇬', 'العربية', 'Arabic'),
    ('es', '🇪🇸', 'Español', 'Spanish'),
    ('fr', '🇫🇷', 'Français', 'French'),
    ('de', '🇩🇪', 'Deutsch', 'German'),
    ('it', '🇮🇹', 'Italiano', 'Italian'),
    ('ru', '🇷🇺', 'Русский', 'Russian'),
    ('tr', '🇹🇷', 'Türkçe', 'Turkish'),
    ('hi', '🇮🇳', 'हिन्दी', 'Hindi'),
    ('zh', '🇨🇳', '中文', 'Chinese'),
    ('pt', '🇵🇹', 'Português', 'Portuguese'),
    ('nl', '🇳🇱', 'Nederlands', 'Dutch'),
    ('ko', '🇰🇷', '한국어', 'Korean'),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;
    final surface = Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.languageLabel),
        centerTitle: true,
      ),
      body: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Text(
                  l10n.selectLanguage, // Add this to ARB if you want it localized
                  style: AppTextStyles.caption(color: AppColors.textMutedLight),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Column(
                  children: List.generate(_languages.length, (index) {
                    final (code, emoji, native, localized) = _languages[index];
                    final isSelected = locale.languageCode == code;
                    final isLast = index == _languages.length - 1;

                    return Column(
                      children: [
                        ListTile(
                          leading: Text(emoji, style: const TextStyle(fontSize: 22)),
                          title: Row(
                            children: [
                              Text(
                                native,
                                style: AppTextStyles.bodyLarge(color: textPrimary)
                                    .copyWith(fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '($localized)',
                                style: AppTextStyles.bodySmall(color: AppColors.textMutedLight),
                              ),
                            ],
                          ),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 24)
                              : const Icon(Icons.circle_outlined, color: AppColors.textMutedLight, size: 24),
                          onTap: () => context.read<LanguageCubit>().setLanguage(code),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: index == 0 ? const Radius.circular(AppRadius.lg) : Radius.zero,
                              bottom: isLast ? const Radius.circular(AppRadius.lg) : Radius.zero,
                            ),
                          ),
                        ),
                        if (!isLast)
                          Divider(
                            height: 1,
                            indent: 56, // Align with text
                            endIndent: 16,
                            color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
                          ),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: Text(
                  l10n.rtlNoteMessage,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall(color: AppColors.textMutedLight)
                      .copyWith(height: 1.4),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
