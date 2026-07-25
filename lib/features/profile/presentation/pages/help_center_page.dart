import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/widgets/app_button.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  static const _faqs = [
    (
      'How do I track my order?',
      'Go to Profile → Order History, tap any order to see its live status timeline.',
    ),
    (
      'What payment methods are accepted?',
      'Cash on Delivery, Credit/Debit Card, Apple Pay, and Google Pay.',
    ),
    (
      'How do I return an item?',
      'Items are eligible for return within 30 days of delivery. Contact support '
          'from this screen to start a return.',
    ),
    (
      'How long does delivery take?',
      'Most orders arrive within 3-5 business days. You\'ll see an estimated '
          'delivery date at checkout and in your order tracking.',
    ),
    (
      'How do I apply a coupon code?',
      'Enter it in the Cart screen just above the order summary, then tap Apply.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(title: const Text('Help Center')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text('Frequently Asked Questions', style: AppTextStyles.h3(color: textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          ..._faqs.map((faq) {
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
                      alignment: Alignment.centerLeft,
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
          Text('Still need help?', style: AppTextStyles.h3(color: textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'Contact Support',
            variant: AppButtonVariant.outlined,
            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18, color: AppColors.primary),
            onPressed: () => AppSnackBar.showInfo(
              context,
              'Live chat support is coming in a future update.',
            ),
          ),
        ],
      ),
    );
  }
}
