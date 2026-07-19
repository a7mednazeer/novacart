import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_details_data.dart';
import '../../domain/usecases/get_product_details_usecase.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._getProductDetails)
      : super(const ProductDetailsLoading());

  final GetProductDetailsUseCase _getProductDetails;

  Future<void> load(String productId) async {
    emit(const ProductDetailsLoading());
    final result = await _getProductDetails(productId);

    result.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (data) => emit(ProductDetailsLoaded(
        data: data,
        selectedColor: data.product.colors.isNotEmpty ? data.product.colors.first : null,
        selectedSize: data.product.sizes.isNotEmpty ? data.product.sizes.first : null,
      )),
    );
  }

  void selectColor(String color) {
    final current = state;
    if (current is ProductDetailsLoaded) {
      emit(current.copyWith(selectedColor: color));
    }
  }

  void selectSize(String size) {
    final current = state;
    if (current is ProductDetailsLoaded) {
      emit(current.copyWith(selectedSize: size));
    }
  }

  void incrementQuantity() {
    final current = state;
    if (current is ProductDetailsLoaded) {
      emit(current.copyWith(quantity: current.quantity + 1));
    }
  }

  void decrementQuantity() {
    final current = state;
    if (current is ProductDetailsLoaded && current.quantity > 1) {
      emit(current.copyWith(quantity: current.quantity - 1));
    }
  }

  /// NOTE: presentation-only until the Wishlist feature is built — that
  /// step replaces this with a real Firestore-backed toggle shared by
  /// Home/Categories/Search/Wishlist.
  void toggleFavorite() {
    final current = state;
    if (current is ProductDetailsLoaded) {
      emit(current.copyWith(isFavorite: !current.isFavorite));
    }
  }
}
