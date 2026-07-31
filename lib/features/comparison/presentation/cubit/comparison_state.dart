part of 'comparison_cubit.dart';

class ComparisonState extends Equatable {
  const ComparisonState({this.products = const []});

  final List<ProductEntity> products;

  bool contains(String productId) => products.any((p) => p.id == productId);

  bool get canCompare => products.length >= 2;

  ComparisonState copyWith({List<ProductEntity>? products}) {
    return ComparisonState(products: products ?? this.products);
  }

  @override
  List<Object?> get props => [products];
}
