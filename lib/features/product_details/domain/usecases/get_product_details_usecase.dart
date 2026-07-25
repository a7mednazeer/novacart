import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_details_data.dart';
import '../repositories/product_details_repository.dart';

class GetProductDetailsUseCase {
  const GetProductDetailsUseCase(this._repository);
  final ProductDetailsRepository _repository;

  Future<Either<Failure, ProductDetailsData>> call(String productId) {
    return _repository.getProductDetails(productId);
  }
}
