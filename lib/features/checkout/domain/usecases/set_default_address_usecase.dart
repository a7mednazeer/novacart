import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/address_repository.dart';

class SetDefaultAddressUseCase {
  const SetDefaultAddressUseCase(this._repository);
  final AddressRepository _repository;

  Future<Either<Failure, void>> call(String uid, String addressId) {
    return _repository.setDefaultAddress(uid, addressId);
  }
}
