import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/entities/review_entity.dart';
import '../../../../generated/l10n/app_localizations.dart';
import 'review_card.dart';

class RatingReviewsSection extends StatelessWidget {
  const RatingReviewsSection({
    super.key,
    required this.product,
    required this.reviews,
    required this.ratingBreakdown,
  });

  final ProductEntity product;
  final List<ReviewEntity> reviews;
  final Map<int, double> ratingBreakdown;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.ratingsAndReviewsTitle, style: AppTextStyles.h2(color: textPrimary)),
        const SizedBox(height: AppSpacing.md),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  product.rating.toStringAsFixed(1),
                  style: AppTextStyles.displaySmall(color: textPrimary),
                ),
                Row(
                  children: List.generate(5, (i) {
                    return Icon(
                      i < product.rating.round()
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      size: 16,
                      color: AppColors.rating,
                    );
                  }),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.reviewsCountLabel(product.reviewCount),
                  style: AppTextStyles.caption(color: AppColors.textMutedLight),
                ),
              ],
            ),
            const SizedBox(width: AppSpacing.xl),
            Expanded(
              child: Column(
                children: [5, 4, 3, 2, 1].map((star) {
                  final fraction = ratingBreakdown[star] ?? 0;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Text('$star', style: AppTextStyles.caption(color: AppColors.textMutedLight)),
                        const SizedBox(width: 4),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                            child: LinearProgressIndicator(
                              value: fraction,
                              minHeight: 6,
                              backgroundColor: AppColors.borderLight,
                              valueColor: const AlwaysStoppedAnimation(AppColors.rating),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        ...reviews.take(3).map((review) => ReviewCard(review: review)),
        if (reviews.length > 3)
          Center(
            child: TextButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => _AllReviewsSheet(reviews: reviews),
              ),
              child: Text(l10n.viewAllReviewsLabel(reviews.length)),
            ),
          ),
      ],
    );
  }
}

class _AllReviewsSheet extends StatelessWidget {
  const _AllReviewsSheet({required this.reviews});
  final List<ReviewEntity> reviews;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).allReviewsTitle(reviews.length),
                style: AppTextStyles.h2(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: reviews.length,
                  itemBuilder: (context, index) => ReviewCard(review: reviews[index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
