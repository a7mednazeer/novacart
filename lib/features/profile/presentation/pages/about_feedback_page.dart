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
      AppSnackBar.showSuccess(context, 'Thanks for your feedback!');
    } catch (e) {
      if (!mounted) return;
      AppSnackBar.showError(context, 'Could not submit feedback. Please try again.');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(title: const Text('About & Feedback')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        children: [
          const Center(child: AppLogo(size: 56, markOnLight: true)),
          const SizedBox(height: AppSpacing.sm),
          Center(
            child: Text(
              _version.isEmpty ? 'Loading version…' : 'Version $_version',
              style: AppTextStyles.bodySmall(color: AppColors.textMutedLight),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Text('Send us feedback', style: AppTextStyles.h3(color: textPrimary)),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Found a bug or have an idea to make NovaCart better? We read every message.',
            style: AppTextStyles.bodySmall(color: AppColors.textSecondaryLight),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _feedbackController,
            maxLines: 5,
            style: AppTextStyles.bodyMedium(color: textPrimary),
            decoration: const InputDecoration(
              hintText: 'Tell us what you think…',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: 'Submit Feedback',
            isLoading: _isSubmitting,
            onPressed: _submitFeedback,
          ),
        ],
      ),
    );
  }
}
