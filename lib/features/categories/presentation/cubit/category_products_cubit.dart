import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/entities/product_filter.dart';
import '../../../product/domain/usecases/filter_products.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this._getProductsByCategory)
      : super(const CategoryProductsLoading());

  final GetProductsByCategoryUseCase _getProductsByCategory;

  Future<void> load(String category) async {
    emit(const CategoryProductsLoading());
    final result = await _getProductsByCategory(category);

    result.fold(
      (failure) => emit(CategoryProductsError(failure.message)),
      (products) => emit(CategoryProductsLoaded(
        allProducts: products,
        filteredProducts: products,
        filter: const ProductFilter(),
      )),
    );
  }

  void applyFilter(ProductFilter filter) {
    final current = state;
    if (current is! CategoryProductsLoaded) return;

    emit(CategoryProductsLoaded(
      allProducts: current.allProducts,
      filteredProducts: FilterProducts.call(current.allProducts, filter),
      filter: filter,
    ));
  }

  void clearFilter() => applyFilter(const ProductFilter());
}
