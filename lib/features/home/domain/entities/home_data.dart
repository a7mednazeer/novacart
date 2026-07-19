import 'package:equatable/equatable.dart';
import '../../../product/domain/entities/banner_entity.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../../../product/domain/entities/product_entity.dart';

/// Aggregate of everything the Home screen needs, assembled once by
/// [GetHomeDataUseCase] rather than having the UI juggle five separate
/// loading states for one screen.
class HomeData extends Equatable {
  const HomeData({
    required this.banners,
    required this.categories,
    required this.flashSaleProducts,
    required this.bestSellers,
    required this.newArrivals,
    required this.recommended,
  });

  final List<BannerEntity> banners;
  final List<CategoryEntity> categories;
  final List<ProductEntity> flashSaleProducts;
  final List<ProductEntity> bestSellers;
  final List<ProductEntity> newArrivals;
  final List<ProductEntity> recommended;

  @override
  List<Object?> get props =>
      [banners, categories, flashSaleProducts, bestSellers, newArrivals, recommended];
}
