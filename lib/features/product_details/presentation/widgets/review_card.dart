import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/l10n/app_localizations.dart';
import '../../domain/entities/review_entity.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final ReviewEntity review;

  String _timeAgo(AppLocalizations l10n, DateTime date) {
    final days = DateTime.now().difference(date).inDays;
    if (days < 1) return l10n.todayLabel;
    if (days < 30) return l10n.daysAgoLabel(days);
    final months = (days / 30).floor();
    return l10n.monthsAgoLabel(months);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;
    final initials = review.userName.isNotEmpty ? review.userName[0] : '?';

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primary.withValues(alpha: 0.12),
            child: Text(
              initials,
              style: AppTextStyles.bodyMedium(color: AppColors.primary)
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.userName,
                      style: AppTextStyles.bodyMedium(color: textPrimary)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      _timeAgo(l10n, review.date),
                      style: AppTextStyles.caption(color: AppColors.textMutedLight),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: List.generate(5, (i) {
                    return Icon(
                      i < review.rating.round()
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      size: 14,
                      color: AppColors.rating,
                    );
                  }),
                ),
                const SizedBox(height: 4),
                Text(
                  review.comment,
                  style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
