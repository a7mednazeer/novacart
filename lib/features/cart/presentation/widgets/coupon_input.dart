import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/l10n/app_localizations.dart';

class CouponInput extends StatefulWidget {
  const CouponInput({
    super.key,
    required this.appliedCode,
    required this.onApply,
    required this.onRemove,
  });

  final String? appliedCode;
  final bool Function(String code) onApply;
  final VoidCallback onRemove;

  @override
  State<CouponInput> createState() => _CouponInputState();
}

class _CouponInputState extends State<CouponInput> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final success = widget.onApply(_controller.text);
    setState(() => _error =
        success ? null : AppLocalizations.of(context).invalidCouponMessage);
    if (success) _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (widget.appliedCode != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: AppColors.discount.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: AppColors.discount.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            const Icon(Icons.local_offer_rounded, size: 18, color: AppColors.discount),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Text(
                l10n.couponApplied(widget.appliedCode!),
                style: AppTextStyles.bodyMedium(color: AppColors.discount)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: widget.onRemove,
              child: const Icon(Icons.close_rounded, size: 18, color: AppColors.discount),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.characters,
                style: AppTextStyles.bodyMedium(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: l10n.enterCouponCode,
                  prefixIcon: const Icon(Icons.local_offer_outlined, size: 18),
                ),
                onSubmitted: (_) => _submit(),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            OutlinedButton(
              onPressed: _submit,
              style: OutlinedButton.styleFrom(minimumSize: const Size(0, 48)),
              child: Text(l10n.applyLabel),
            ),
          ],
        ),
        if (_error != null) ...[
          const SizedBox(height: 4),
          Text(_error!, style: AppTextStyles.caption(color: AppColors.error)),
        ],
      ],
    );
  }
}
