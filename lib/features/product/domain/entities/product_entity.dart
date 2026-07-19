import 'package:equatable/equatable.dart';

/// Core catalog entity. Deliberately backend-agnostic — whether product
/// data comes from Firestore, a REST API, or mock data, every feature
/// (Home, Categories, Search, Wishlist, Cart, Product Details) only
/// ever depends on this shape.
class ProductEntity extends Equatable {
  ProductEntity({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.discountPercent = 0,
    this.rating = 0,
    this.reviewCount = 0,
    this.soldCount = 0,
    this.isFlashSale = false,
    this.flashSaleEndsAt,
    this.isNew = false,
    this.description = '',
    this.images = const [],
    this.colors = const [],
    this.sizes = const [],
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.fromMillisecondsSinceEpoch(0);

  final String id;
  final String name;
  final String brand;
  final String category;
  final double price;
  final String imageUrl;
  final int discountPercent;
  final double rating;
  final int reviewCount;
  final int soldCount;
  final bool isFlashSale;
  final DateTime? flashSaleEndsAt;
  final bool isNew;
  final String description;
  final List<String> images;
  final List<String> colors;
  final List<String> sizes;
  final DateTime createdAt;

  double get discountedPrice =>
      discountPercent > 0 ? price * (1 - discountPercent / 100) : price;

  bool get hasDiscount => discountPercent > 0;

  @override
  List<Object?> get props => [id, name, price, discountPercent, imageUrl];
}
