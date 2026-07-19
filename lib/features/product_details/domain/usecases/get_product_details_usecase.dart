import 'package:dartz/dartz.dart';
import 'package:novacart/core/errors/failures.dart';
import 'package:novacart/features/product_details/domain/entities/product_details_data.dart';
import 'package:novacart/features/product_details/domain/repositories/product_details_repository.dart';

class GetProductDetailsUseCase {
  const GetProductDetailsUseCase(this._repository);
  final ProductDetailsRepository _repository;

  Future<Either<Failure, ProductDetailsData>> call(String productId) {
    return _repository.getProductDetails(productId);
  }
}
