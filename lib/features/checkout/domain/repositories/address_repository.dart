import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/address_entity.dart';

abstract class AddressRepository {
  Stream<List<AddressEntity>> watchAddresses(String uid);

  Future<Either<Failure, String>> addAddress(String uid, AddressEntity address);

  Future<Either<Failure, void>> deleteAddress(String uid, String addressId);

  Future<Either<Failure, void>> setDefaultAddress(String uid, String addressId);
}
