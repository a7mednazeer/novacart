import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../repositories/category_repository.dart';

class GetProductsByCategoryUseCase {
  const GetProductsByCategoryUseCase(this._repository);
  final CategoryRepository _repository;

  Future<Either<Failure, List<ProductEntity>>> call(String category) {
    return _repository.getProductsByCategory(category);
  }
}
