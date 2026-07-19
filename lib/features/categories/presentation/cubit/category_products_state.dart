part of 'category_products_cubit.dart';

sealed class CategoryProductsState extends Equatable {
  const CategoryProductsState();

  @override
  List<Object?> get props => [];
}

class CategoryProductsLoading extends CategoryProductsState {
  const CategoryProductsLoading();
}

class CategoryProductsError extends CategoryProductsState {
  const CategoryProductsError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class CategoryProductsLoaded extends CategoryProductsState {
  const CategoryProductsLoaded({
    required this.allProducts,
    required this.filteredProducts,
    required this.filter,
  });

  /// Unfiltered products for this category — kept so re-filtering
  /// doesn't require another fetch.
  final List<ProductEntity> allProducts;
  final List<ProductEntity> filteredProducts;
  final ProductFilter filter;

  List<String> get availableBrands =>
      allProducts.map((p) => p.brand).toSet().toList()..sort();

  double get maxPrice => allProducts.isEmpty
      ? 1000
      : allProducts.map((p) => p.price).reduce((a, b) => a > b ? a : b);

  @override
  List<Object?> get props => [allProducts, filteredProducts, filter];
}
