import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../support/presentation/pages/support_chat_page.dart';
import '../../../../generated/l10n/app_localizations.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;
    final faqs = [
      (l10n.faqQ1, l10n.faqA1),
      (l10n.faqQ2, l10n.faqA2),
      (l10n.faqQ3, l10n.faqA3),
      (l10n.faqQ4, l10n.faqA4),
      (l10n.faqQ5, l10n.faqA5),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.helpCenterLabel)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(l10n.helpCenterFaqTitle, style: AppTextStyles.h3(color: textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          ...faqs.map((faq) {
            final (question, answer) = faq;
            return Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    question,
                    style: AppTextStyles.bodyMedium(color: textPrimary)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  childrenPadding: const EdgeInsets.fromLTRB(
                    AppSpacing.md, 0, AppSpacing.md, AppSpacing.md,
                  ),
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        answer,
                        style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.stillNeedHelpTitle, style: AppTextStyles.h3(color: textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.contactSupportLabel,
            variant: AppButtonVariant.outlined,
            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18, color: AppColors.primary),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SupportChatPage()),
            ),
          ),
        ],
      ),
    );
  }
}
