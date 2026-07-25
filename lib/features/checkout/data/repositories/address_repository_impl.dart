import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../datasources/address_remote_datasource.dart';
import '../models/address_model.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl(this._dataSource);
  final AddressRemoteDataSource _dataSource;

  @override
  Stream<List<AddressEntity>> watchAddresses(String uid) {
    return _dataSource.watchAddresses(uid).map((models) {
      return models.map((m) => m as AddressEntity).toList();
    }).handleError((_) => <AddressEntity>[]);
  }

  @override
  Future<Either<Failure, String>> addAddress(String uid, AddressEntity address) async {
    try {
      final model = AddressModel(
        id: '',
        fullName: address.fullName,
        phone: address.phone,
        addressLine: address.addressLine,
        city: address.city,
        isDefault: address.isDefault,
      );
      final id = await _dataSource.addAddress(uid, model);
      return Right(id);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(String uid, String addressId) async {
    try {
      await _dataSource.deleteAddress(uid, addressId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setDefaultAddress(String uid, String addressId) async {
    try {
      await _dataSource.setDefaultAddress(uid, addressId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
