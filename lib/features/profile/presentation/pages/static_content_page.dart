import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/l10n/app_localizations.dart';

/// A single reusable scaffold for any long-form static text screen.
/// Privacy Policy and Terms & Conditions both use this with different
/// [title]/[sections] rather than being two near-duplicate files.
class StaticContentPage extends StatelessWidget {
  const StaticContentPage({
    super.key,
    required this.title,
    required this.sections,
  });

  final String title;

  /// (heading, body) pairs rendered in order.
  final List<(String, String)> sections;

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: sections.map((section) {
          final (heading, body) = section;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading, style: AppTextStyles.h3(color: textPrimary)),
                const SizedBox(height: 6),
                Text(body, style: AppTextStyles.bodyMedium(color: textPrimary)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Localized section lists — built at call time (not top-level `const`)
/// since the headings/bodies now come from `AppLocalizations`. Called
/// from `ProfilePage` where a `BuildContext` is already available.
List<(String, String)> buildPrivacyPolicySections(AppLocalizations l10n) {
  return [
    (l10n.privacySection1Heading, l10n.privacySection1Body),
    (l10n.privacySection2Heading, l10n.privacySection2Body),
    (l10n.privacySection3Heading, l10n.privacySection3Body),
    (l10n.privacySection4Heading, l10n.privacySection4Body),
  ];
}

List<(String, String)> buildTermsAndConditionsSections(AppLocalizations l10n) {
  return [
    (l10n.termsSection1Heading, l10n.termsSection1Body),
    (l10n.termsSection2Heading, l10n.termsSection2Body),
    (l10n.termsSection3Heading, l10n.termsSection3Body),
    (l10n.termsSection4Heading, l10n.termsSection4Body),
  ];
}
