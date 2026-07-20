import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';

/// A thin, generic "read the catalog" contract. Home/Categories/Search
/// each already wrap `ProductRemoteDataSource` with their own narrow
/// repository (sorted/filtered a specific way); this one is for
/// features — Wishlist, Cart — that just need to resolve a set of
/// product ids back into full [ProductEntity] objects.
abstract class ProductCatalogRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
