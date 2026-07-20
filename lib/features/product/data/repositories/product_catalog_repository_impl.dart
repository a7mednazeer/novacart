import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../datasources/product_remote_datasource.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_catalog_repository.dart';

class ProductCatalogRepositoryImpl implements ProductCatalogRepository {
  ProductCatalogRepositoryImpl(this._dataSource);
  final ProductRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final products = await _dataSource.getAllProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
