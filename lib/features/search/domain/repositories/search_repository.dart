import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../product/domain/entities/product_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);
}
