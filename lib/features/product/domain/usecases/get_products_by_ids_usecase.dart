import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_catalog_repository.dart';

/// Resolves a set of product ids into full [ProductEntity] objects.
/// Both Wishlist (favorited ids) and Cart (cart line item ids) need
/// exactly this — fetch the catalog once, filter to the ids they
/// care about — so it lives here instead of being duplicated in each
/// feature.
class GetProductsByIdsUseCase {
  const GetProductsByIdsUseCase(this._repository);
  final ProductCatalogRepository _repository;

  Future<Either<Failure, List<ProductEntity>>> call(Set<String> ids) async {
    final result = await _repository.getAllProducts();
    return result.map(
      (products) => products.where((p) => ids.contains(p.id)).toList(),
    );
  }
}
