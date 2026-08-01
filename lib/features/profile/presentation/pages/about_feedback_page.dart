import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../data/feedback_service.dart';
import '../../../../generated/l10n/app_localizations.dart';

class AboutFeedbackPage extends StatefulWidget {
  const AboutFeedbackPage({super.key});

  @override
  State<AboutFeedbackPage> createState() => _AboutFeedbackPageState();
}

class _AboutFeedbackPageState extends State<AboutFeedbackPage> {
  final _feedbackController = TextEditingController();
  bool _isSubmitting = false;
  String _version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() => _version = '${info.version} (${info.buildNumber})');
    }
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    final message = _feedbackController.text.trim();
    if (message.isEmpty) return;

    setState(() => _isSubmitting = true);
    try {
      await sl<FeedbackService>().submit(message);
      if (!mounted) return;
      _feedbackController.clear();
      AppSnackBar.showSuccess(context, AppLocalizations.of(context).feedbackThanksMessage);
    } catch (e) {
      if (!mounted) return;
      AppSnackBar.showError(context, AppLocalizations.of(context).feedbackErrorMessage);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.aboutFeedbackTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        children: [
          const Center(child: AppLogo(size: 56, markOnLight: true)),
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: Text(
              _version.isEmpty ? l10n.loadingVersionLabel : l10n.versionLabel(_version),
              style: AppTextStyles.bodySmall(color: AppColors.textMutedLight),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text(l10n.sendUsFeedbackTitle, style: AppTextStyles.h3(color: textPrimary)),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.feedbackIntroMessage,
            style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _feedbackController,
            maxLines: 5,
            style: AppTextStyles.bodyMedium(color: textPrimary),
            decoration: InputDecoration(
              hintText: l10n.feedbackHintText,
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: l10n.submitFeedbackLabel,
            isLoading: _isSubmitting,
            onPressed: _submitFeedback,
          ),
        ],
      ),
    );
  }
}
