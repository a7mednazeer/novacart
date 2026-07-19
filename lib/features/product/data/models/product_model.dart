import '../../domain/entities/product_entity.dart';

/// Firestore-facing representation of a product. Keeps
/// `fromFirestore`/`toFirestore` mapping isolated from the pure
/// [ProductEntity] the rest of the app depends on.
class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.brand,
    required super.category,
    required super.price,
    required super.imageUrl,
    super.discountPercent,
    super.rating,
    super.reviewCount,
    super.soldCount,
    super.isFlashSale,
    super.flashSaleEndsAt,
    super.isNew,
    super.description,
    super.images,
    super.colors,
    super.sizes,
    super.createdAt,
  });

  factory ProductModel.fromFirestore(String id, Map<String, dynamic> data) {
    return ProductModel(
      id: id,
      name: data['name'] as String? ?? '',
      brand: data['brand'] as String? ?? '',
      category: data['category'] as String? ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0,
      imageUrl: data['imageUrl'] as String? ?? '',
      discountPercent: (data['discountPercent'] as num?)?.toInt() ?? 0,
      rating: (data['rating'] as num?)?.toDouble() ?? 0,
      reviewCount: (data['reviewCount'] as num?)?.toInt() ?? 0,
      soldCount: (data['soldCount'] as num?)?.toInt() ?? 0,
      isFlashSale: data['isFlashSale'] as bool? ?? false,
      flashSaleEndsAt: data['flashSaleEndsAt'] != null
          ? DateTime.tryParse(data['flashSaleEndsAt'] as String)
          : null,
      isNew: data['isNew'] as bool? ?? false,
      description: data['description'] as String? ?? '',
      images: (data['images'] as List?)?.cast<String>() ?? const [],
      colors: (data['colors'] as List?)?.cast<String>() ?? const [],
      sizes: (data['sizes'] as List?)?.cast<String>() ?? const [],
      createdAt: data['createdAt'] != null
          ? DateTime.tryParse(data['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'brand': brand,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'discountPercent': discountPercent,
      'rating': rating,
      'reviewCount': reviewCount,
      'soldCount': soldCount,
      'isFlashSale': isFlashSale,
      'flashSaleEndsAt': flashSaleEndsAt?.toIso8601String(),
      'isNew': isNew,
      'description': description,
      'images': images,
      'colors': colors,
      'sizes': sizes,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
