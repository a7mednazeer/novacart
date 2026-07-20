import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/cart_icon_button.dart';
import '../../../product/data/datasources/category_mock_data.dart';
import '../../../product/data/datasources/subcategory_mock_data.dart';
import '../../../product/domain/entities/subcategory_entity.dart';
import '../widgets/category_sidebar.dart';
import '../widgets/subcategory_grid.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final category = shopCategories[_selectedIndex];
    final subcategories = subcategoriesByCategory[category.id] ?? const [];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: AppSpacing.lg,
        title: GestureDetector(
          onTap: () => context.push(AppRoutes.search),
          child: Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AppRadius.pill),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Row(
              children: [
                const Icon(Icons.search_rounded, size: 20, color: AppColors.textMutedLight),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'What do you search for?',
                  style: AppTextStyles.bodyMedium(color: AppColors.textMutedLight),
                ),
              ],
            ),
          ),
        ),
        actions: const [CartIconButton(), SizedBox(width: AppSpacing.xs)],
      ),
      body: Row(
        children: [
          CategorySidebar(
            categories: shopCategories,
            selectedIndex: _selectedIndex,
            onSelect: (index) => setState(() => _selectedIndex = index),
          ),
          Expanded(
            child: SubcategoryGrid(
              key: ValueKey(category.id),
              category: category,
              subcategories: subcategories,
              onSubcategoryTap: (sub) => _openCategoryProducts(
                category.name,
                subcategory: sub,
              ),
              onBrowseAllTap: () => _openCategoryProducts(category.name),
            ),
          ),
        ],
      ),
    );
  }

  void _openCategoryProducts(String categoryName, {SubcategoryEntity? subcategory}) {
    context.push(
      AppRoutes.categoryProducts,
      extra: {
        'category': categoryName,
        'subcategoryName': subcategory?.name,
      },
    );
  }
}
