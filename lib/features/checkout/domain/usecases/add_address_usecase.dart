import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/address_entity.dart';
import '../repositories/address_repository.dart';

class AddAddressUseCase {
  const AddAddressUseCase(this._repository);
  final AddressRepository _repository;

  Future<Either<Failure, String>> call(String uid, AddressEntity address) {
    return _repository.addAddress(uid, address);
  }
}
