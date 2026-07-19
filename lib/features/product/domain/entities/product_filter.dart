import 'package:equatable/equatable.dart';

enum ProductSortOption {
  relevance,
  priceLowToHigh,
  priceHighToLow,
  ratingHighToLow,
  newest,
}

extension ProductSortOptionLabel on ProductSortOption {
  String get label => switch (this) {
        ProductSortOption.relevance => 'Relevance',
        ProductSortOption.priceLowToHigh => 'Price: Low to High',
        ProductSortOption.priceHighToLow => 'Price: High to Low',
        ProductSortOption.ratingHighToLow => 'Highest Rated',
        ProductSortOption.newest => 'Newest First',
      };
}

/// Immutable filter/sort selection shared by Categories and Search, so
/// the exact same [FilterBottomSheet] widget and filtering logic can
/// be reused by both screens instead of two parallel implementations.
class ProductFilter extends Equatable {
  const ProductFilter({
    this.minPrice,
    this.maxPrice,
    this.minRating = 0,
    this.brands = const {},
    this.sortBy = ProductSortOption.relevance,
  });

  final double? minPrice;
  final double? maxPrice;
  final double minRating;
  final Set<String> brands;
  final ProductSortOption sortBy;

  bool get isActive =>
      minPrice != null || maxPrice != null || minRating > 0 || brands.isNotEmpty;

  int get activeCount =>
      (minPrice != null || maxPrice != null ? 1 : 0) +
      (minRating > 0 ? 1 : 0) +
      (brands.isNotEmpty ? 1 : 0);

  ProductFilter copyWith({
    double? minPrice,
    double? maxPrice,
    double? minRating,
    Set<String>? brands,
    ProductSortOption? sortBy,
    bool clearPriceRange = false,
  }) {
    return ProductFilter(
      minPrice: clearPriceRange ? null : (minPrice ?? this.minPrice),
      maxPrice: clearPriceRange ? null : (maxPrice ?? this.maxPrice),
      minRating: minRating ?? this.minRating,
      brands: brands ?? this.brands,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  @override
  List<Object?> get props => [minPrice, maxPrice, minRating, brands, sortBy];
}
