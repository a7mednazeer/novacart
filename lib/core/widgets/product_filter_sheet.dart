import 'package:flutter/material.dart';
import '../../features/product/domain/entities/product_filter.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import '../constants/app_text_styles.dart';
import '../../generated/l10n/app_localizations.dart';
import 'app_button.dart';

/// Opens as a modal bottom sheet from both the Categories product
/// listing and Search results. Returns the user's chosen
/// [ProductFilter] via [showProductFilterSheet]; the calling screen
/// owns applying it (via `FilterProducts.call`) and persisting it in
/// its own cubit state.
Future<ProductFilter?> showProductFilterSheet(
  BuildContext context, {
  required ProductFilter current,
  required List<String> availableBrands,
  required double catalogMaxPrice,
}) {
  return showModalBottomSheet<ProductFilter>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
    ),
    builder: (context) => _FilterSheetContent(
      current: current,
      availableBrands: availableBrands,
      catalogMaxPrice: catalogMaxPrice,
    ),
  );
}

String _sortOptionLabel(AppLocalizations l10n, ProductSortOption option) {
  return switch (option) {
    ProductSortOption.relevance => l10n.sortRelevance,
    ProductSortOption.priceLowToHigh => l10n.sortPriceLowToHigh,
    ProductSortOption.priceHighToLow => l10n.sortPriceHighToLow,
    ProductSortOption.ratingHighToLow => l10n.sortRatingHighToLow,
    ProductSortOption.newest => l10n.sortNewest,
  };
}

class _FilterSheetContent extends StatefulWidget {
  const _FilterSheetContent({
    required this.current,
    required this.availableBrands,
    required this.catalogMaxPrice,
  });

  final ProductFilter current;
  final List<String> availableBrands;
  final double catalogMaxPrice;

  @override
  State<_FilterSheetContent> createState() => _FilterSheetContentState();
}

class _FilterSheetContentState extends State<_FilterSheetContent> {
  late RangeValues _priceRange = RangeValues(
    widget.current.minPrice ?? 0,
    widget.current.maxPrice ?? widget.catalogMaxPrice,
  );
  late double _minRating = widget.current.minRating;
  late Set<String> _brands = {...widget.current.brands};
  late ProductSortOption _sortBy = widget.current.sortBy;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textPrimary = Theme.of(context).colorScheme.onSurface;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          top: AppSpacing.md,
          bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.filterAndSort, style: AppTextStyles.h1(color: textPrimary)),
                  TextButton(
                    onPressed: () => setState(() {
                      _priceRange = RangeValues(0, widget.catalogMaxPrice);
                      _minRating = 0;
                      _brands = {};
                      _sortBy = ProductSortOption.relevance;
                    }),
                    child: Text(l10n.resetLabel),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              Text(l10n.sortByLabel, style: AppTextStyles.h3(color: textPrimary)),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ProductSortOption.values.map((option) {
                  final selected = _sortBy == option;
                  return ChoiceChip(
                    label: Text(_sortOptionLabel(l10n, option)),
                    selected: selected,
                    onSelected: (_) => setState(() => _sortBy = option),
                    selectedColor: AppColors.primary.withValues(alpha: 0.15),
                    labelStyle: AppTextStyles.bodySmall(
                      color: selected ? AppColors.primary : AppColors.textSecondaryLight,
                    ),
                    side: BorderSide(
                      color: selected ? AppColors.primary : Theme.of(context).dividerColor,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: AppSpacing.xl),
              Text(l10n.priceRangeLabel, style: AppTextStyles.h3(color: textPrimary)),
              RangeSlider(
                values: _priceRange,
                min: 0,
                max: widget.catalogMaxPrice,
                divisions: 20,
                activeColor: AppColors.primary,
                labels: RangeLabels(
                  'EGP ${_priceRange.start.round()}',
                  'EGP ${_priceRange.end.round()}',
                ),
                onChanged: (values) => setState(() => _priceRange = values),
              ),

              const SizedBox(height: AppSpacing.md),
              Text(l10n.minimumRatingLabel, style: AppTextStyles.h3(color: textPrimary)),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: 8,
                children: [0, 3, 3.5, 4, 4.5].map((rating) {
                  final selected = _minRating == rating;
                  return ChoiceChip(
                    label: Text(rating == 0 ? l10n.anyLabel : '$rating★'),
                    selected: selected,
                    onSelected: (_) => setState(() => _minRating = rating.toDouble()),
                    selectedColor: AppColors.primary.withValues(alpha: 0.15),
                    labelStyle: AppTextStyles.bodySmall(
                      color: selected ? AppColors.primary : AppColors.textSecondaryLight,
                    ),
                    side: BorderSide(
                      color: selected ? AppColors.primary : Theme.of(context).dividerColor,
                    ),
                  );
                }).toList(),
              ),

              if (widget.availableBrands.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xl),
                Text(l10n.brandLabel, style: AppTextStyles.h3(color: textPrimary)),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.availableBrands.map((brand) {
                    final selected = _brands.contains(brand);
                    return FilterChip(
                      label: Text(brand),
                      selected: selected,
                      onSelected: (isSelected) => setState(() {
                        isSelected ? _brands.add(brand) : _brands.remove(brand);
                      }),
                      selectedColor: AppColors.primary.withValues(alpha: 0.15),
                      labelStyle: AppTextStyles.bodySmall(
                        color: selected ? AppColors.primary : AppColors.textSecondaryLight,
                      ),
                      side: BorderSide(
                        color: selected ? AppColors.primary : Theme.of(context).dividerColor,
                      ),
                    );
                  }).toList(),
                ),
              ],

              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: l10n.applyFiltersLabel,
                onPressed: () => Navigator.of(context).pop(
                  ProductFilter(
                    minPrice: _priceRange.start > 0 ? _priceRange.start : null,
                    maxPrice: _priceRange.end < widget.catalogMaxPrice
                        ? _priceRange.end
                        : null,
                    minRating: _minRating,
                    brands: _brands,
                    sortBy: _sortBy,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
