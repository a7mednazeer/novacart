import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../../../product/domain/entities/subcategory_entity.dart';
import '../../../../generated/l10n/app_localizations.dart';

class SubcategoryGrid extends StatelessWidget {
  const SubcategoryGrid({
    super.key,
    required this.category,
    required this.subcategories,
    required this.onSubcategoryTap,
    required this.onBrowseAllTap,
  });

  final CategoryEntity category;
  final List<SubcategoryEntity> subcategories;
  final ValueChanged<SubcategoryEntity> onSubcategoryTap;
  final VoidCallback onBrowseAllTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://picsum.photos/seed/${category.id}-banner/600/340',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const ShimmerBox(borderRadius: 0),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withValues(alpha: 0.6),
                        Colors.black.withValues(alpha: 0.05),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: AppSpacing.lg,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.localizedName(context),
                        style: AppTextStyles.h1(color: Colors.white),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      AppButton(
                        label: l10n.shopNow,
                        onPressed: onBrowseAllTap,
                        fullWidth: false,
                        height: 36,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (subcategories.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
              child: Center(
                child: Text(
                  l10n.browseAllIn(category.name),
                  style: AppTextStyles.bodyMedium(color: AppColors.textSecondaryLight),
                ),
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subcategories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.sm,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final sub = subcategories[index];
                return GestureDetector(
                  onTap: () => onSubcategoryTap(sub),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl: sub.imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const ShimmerBox(borderRadius: 0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        sub.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySmall(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
