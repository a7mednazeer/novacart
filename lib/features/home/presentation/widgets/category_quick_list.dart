import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../product/domain/entities/category_entity.dart';

class CategoryQuickList extends StatelessWidget {
  const CategoryQuickList({
    super.key,
    required this.categories,
    required this.onCategoryTap,
  });

  final List<CategoryEntity> categories;
  final ValueChanged<CategoryEntity> onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onCategoryTap(category),
            child: SizedBox(
              width: 68,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.10),
                          AppColors.secondary.withValues(alpha: 0.10),
                        ],
                      ),
                    ),
                    child: Icon(category.icon, color: AppColors.primary, size: 28),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption(color: AppColors.textSecondaryLight),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
