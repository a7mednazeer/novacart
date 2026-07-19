import 'package:dartz/dartz.dart';
import 'package:novacart/features/home/domain/entities/home_data.dart';
import 'package:novacart/features/home/domain/repositories/home_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../product/data/datasources/category_mock_data.dart';
import '../../../product/data/datasources/product_remote_datasource.dart';


/// Builds the Home screen's sections (flash sale, best sellers, new
/// arrivals, recommended) by slicing/sorting the shared product
/// catalog from [ProductRemoteDataSource] — rather than each section
/// needing its own Firestore query, which would multiply reads for
/// data that's already fetched once.
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._productDataSource);

  final ProductRemoteDataSource _productDataSource;

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    try {
      final products = await _productDataSource.getAllProducts();
      final banners = await _productDataSource.getBanners();

      final flashSale = products.where((p) => p.isFlashSale).toList();

      final bestSellers = [...products]
        ..sort((a, b) => b.soldCount.compareTo(a.soldCount));

      final newArrivals = products.where((p) => p.isNew).toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      final recommended = [...products]
        ..sort((a, b) => b.rating.compareTo(a.rating));

      return Right(HomeData(
        banners: banners,
        categories: shopCategories,
        flashSaleProducts: flashSale.take(10).toList(),
        bestSellers: bestSellers.take(10).toList(),
        newArrivals: newArrivals.take(10).toList(),
        recommended: recommended.take(10).toList(),
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
