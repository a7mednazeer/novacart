import 'package:dartz/dartz.dart';
import 'package:novacart/core/errors/failures.dart';
import 'package:novacart/features/product/data/datasources/product_remote_datasource.dart';
import 'package:novacart/features/product_details/domain/entities/product_details_data.dart';
import 'package:novacart/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:novacart/features/product_details/data/datasources/review_mock_data.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  ProductDetailsRepositoryImpl(this._dataSource);
  final ProductRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, ProductDetailsData>> getProductDetails(
    String productId,
  ) async {
    try {
      final all = await _dataSource.getAllProducts();
      final product = all.where((p) => p.id == productId).firstOrNull;

      if (product == null) {
        return const Left(ServerFailure('This product could not be found.'));
      }

      final similar = all
          .where((p) => p.category == product.category && p.id != product.id)
          .take(10)
          .toList();

      return Right(ProductDetailsData(
        product: product,
        reviews: generateMockReviews(productId),
        similarProducts: similar,
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
