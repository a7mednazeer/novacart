part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object?> get props => [];
}

class ProductDetailsLoading extends ProductDetailsState {
  const ProductDetailsLoading();
}

class ProductDetailsError extends ProductDetailsState {
  const ProductDetailsError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class ProductDetailsLoaded extends ProductDetailsState {
  const ProductDetailsLoaded({
    required this.data,
    this.selectedColor,
    this.selectedSize,
    this.quantity = 1,
    this.isFavorite = false,
  });

  final ProductDetailsData data;
  final String? selectedColor;
  final String? selectedSize;
  final int quantity;
  final bool isFavorite;

  double get totalPrice => data.product.discountedPrice * quantity;

  ProductDetailsLoaded copyWith({
    String? selectedColor,
    String? selectedSize,
    int? quantity,
    bool? isFavorite,
  }) {
    return ProductDetailsLoaded(
      data: data,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props =>
      [data, selectedColor, selectedSize, quantity, isFavorite];
}
