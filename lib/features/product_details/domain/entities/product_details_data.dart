import 'package:equatable/equatable.dart';
import '../../../product/domain/entities/product_entity.dart';
import 'review_entity.dart';

/// Everything the Product Details screen needs, assembled by
/// [GetProductDetailsUseCase] in one call — mirrors the `HomeData`
/// pattern from the Home feature.
class ProductDetailsData extends Equatable {
  const ProductDetailsData({
    required this.product,
    required this.reviews,
    required this.similarProducts,
  });

  final ProductEntity product;
  final List<ReviewEntity> reviews;
  final List<ProductEntity> similarProducts;

  /// Rating histogram (5★ down to 1★) as a fraction of total reviews,
  /// used to draw the rating breakdown bars.
  Map<int, double> get ratingBreakdown {
    if (reviews.isEmpty) {
      return {5: 0, 4: 0, 3: 0, 2: 0, 1: 0};
    }
    final counts = <int, int>{5: 0, 4: 0, 3: 0, 2: 0, 1: 0};
    for (final review in reviews) {
      final bucket = review.rating.round().clamp(1, 5);
      counts[bucket] = (counts[bucket] ?? 0) + 1;
    }
    return counts.map((k, v) => MapEntry(k, v / reviews.length));
  }

  @override
  List<Object?> get props => [product, reviews, similarProducts];
}
