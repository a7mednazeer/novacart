part of 'recently_viewed_cubit.dart';

class RecentlyViewedState extends Equatable {
  const RecentlyViewedState({
    this.products = const [],
    this.isLoading = true,
  });

  final List<ProductEntity> products;
  final bool isLoading;

  RecentlyViewedState copyWith({List<ProductEntity>? products, bool? isLoading}) {
    return RecentlyViewedState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [products, isLoading];
}
