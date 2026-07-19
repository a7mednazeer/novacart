import 'package:dartz/dartz.dart';
import 'package:novacart/core/errors/failures.dart';
import 'package:novacart/features/product_details/domain/entities/product_details_data.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsData>> getProductDetails(String productId);
}
