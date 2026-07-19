import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../product/data/datasources/product_remote_datasource.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(this._dataSource);
  final ProductRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String category,
  ) async {
    try {
      final products = await _dataSource.getProductsByCategory(category);
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
