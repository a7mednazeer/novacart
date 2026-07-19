import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../product/data/datasources/product_remote_datasource.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../domain/repositories/search_repository.dart';

/// Filters the shared catalog client-side by name/brand/category match.
/// Fine for a catalog this size; for a production catalog with
/// thousands of SKUs, swap this implementation for a real search
/// index (Algolia/Typesense/Meilisearch — Firestore itself has no
/// native full-text search) without touching `SearchCubit` or the UI,
/// since both only depend on [SearchRepository].
class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this._dataSource);
  final ProductRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
    String query,
  ) async {
    try {
      final all = await _dataSource.getAllProducts();
      final normalized = query.trim().toLowerCase();

      if (normalized.isEmpty) return const Right([]);

      final results = all.where((p) {
        return p.name.toLowerCase().contains(normalized) ||
            p.brand.toLowerCase().contains(normalized) ||
            p.category.toLowerCase().contains(normalized);
      }).toList();

      return Right(results);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
