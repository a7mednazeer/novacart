import '../entities/product_entity.dart';
import '../entities/product_filter.dart';

/// A pure, side-effect-free transform: `List<ProductEntity> in → List<ProductEntity> out`.
/// Both `CategoryProductsCubit` and `SearchCubit` call this with their
/// own unfiltered list + the user's [ProductFilter] selection, so the
/// filtering/sorting rules only ever live in one place.
class FilterProducts {
  const FilterProducts._();

  static List<ProductEntity> call(
    List<ProductEntity> products,
    ProductFilter filter,
  ) {
    var result = products.where((p) {
      final price = p.discountedPrice;
      if (filter.minPrice != null && price < filter.minPrice!) return false;
      if (filter.maxPrice != null && price > filter.maxPrice!) return false;
      if (filter.minRating > 0 && p.rating < filter.minRating) return false;
      if (filter.brands.isNotEmpty && !filter.brands.contains(p.brand)) {
        return false;
      }
      return true;
    }).toList();

    switch (filter.sortBy) {
      case ProductSortOption.priceLowToHigh:
        result.sort((a, b) => a.discountedPrice.compareTo(b.discountedPrice));
        break;
      case ProductSortOption.priceHighToLow:
        result.sort((a, b) => b.discountedPrice.compareTo(a.discountedPrice));
        break;
      case ProductSortOption.ratingHighToLow:
        result.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case ProductSortOption.newest:
        result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case ProductSortOption.relevance:
        break;
    }

    return result;
  }
}
