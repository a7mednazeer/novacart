import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../repositories/search_repository.dart';

class SearchProductsUseCase {
  const SearchProductsUseCase(this._repository);
  final SearchRepository _repository;

  Future<Either<Failure, List<ProductEntity>>> call(String query) {
    return _repository.searchProducts(query);
  }
}
