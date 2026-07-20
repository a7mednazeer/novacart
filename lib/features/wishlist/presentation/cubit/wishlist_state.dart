part of 'wishlist_cubit.dart';

class WishlistState extends Equatable {
  const WishlistState({
    this.ids = const {},
    this.products,
    this.isLoadingProducts = false,
  });

  /// Favorited product ids — this is what every `ProductCard`'s heart
  /// icon across the app reads from.
  final Set<String> ids;

  /// Resolved product objects for the ids, only populated once the
  /// Wishlist screen has actually been opened (`loadProducts()`) —
  /// no reason to fetch full product data just to light up hearts.
  final List<ProductEntity>? products;
  final bool isLoadingProducts;

  WishlistState copyWith({
    Set<String>? ids,
    List<ProductEntity>? products,
    bool? isLoadingProducts,
  }) {
    return WishlistState(
      ids: ids ?? this.ids,
      products: products ?? this.products,
      isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
    );
  }

  @override
  List<Object?> get props => [ids, products, isLoadingProducts];
}
