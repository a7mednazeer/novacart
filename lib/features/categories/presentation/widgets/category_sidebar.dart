import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../product/domain/entities/category_entity.dart';

class CategorySidebar extends StatelessWidget {
  const CategorySidebar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<CategoryEntity> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      color: Theme.of(context).colorScheme.surface,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = index == selectedIndex;

          return InkWell(
            onTap: () => onSelect(index),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.md,
                horizontal: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Colors.transparent,
                border: Border(
                  left: BorderSide(
                    color: selected ? AppColors.primary : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    category.icon,
                    size: 22,
                    color: selected ? AppColors.primary : AppColors.textMutedLight,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption(
                      color: selected
                          ? AppColors.primary
                          : AppColors.textSecondaryLight,
                    ).copyWith(fontWeight: selected ? FontWeight.w700 : FontWeight.w500),
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
