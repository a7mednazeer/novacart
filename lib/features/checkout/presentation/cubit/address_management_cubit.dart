import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/current_user_service.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/repositories/address_repository.dart';
import '../../domain/usecases/add_address_usecase.dart';
import '../../domain/usecases/delete_address_usecase.dart';
import '../../domain/usecases/set_default_address_usecase.dart';

part 'address_management_state.dart';

/// A generic address-book cubit — distinct from `CheckoutCubit`, which
/// also deals with addresses but is scoped to one checkout session
/// (step flow, selection for an order). This one just manages the
/// address book itself and is reused by Profile's "Saved Addresses"
/// screen.
class AddressManagementCubit extends Cubit<AddressManagementState> {
  AddressManagementCubit(
    this._repository,
    this._addUseCase,
    this._deleteUseCase,
    this._setDefaultUseCase,
    this._currentUser,
  ) : super(const AddressManagementLoading());

  final AddressRepository _repository;
  final AddAddressUseCase _addUseCase;
  final DeleteAddressUseCase _deleteUseCase;
  final SetDefaultAddressUseCase _setDefaultUseCase;
  final CurrentUserService _currentUser;

  StreamSubscription<List<AddressEntity>>? _subscription;

  void loadAddresses() {
    final uid = _currentUser.uid;
    if (uid == null) return;

    _subscription?.cancel();
    _subscription = _repository.watchAddresses(uid).listen(
          (addresses) => emit(AddressManagementLoaded(addresses)),
          onError: (_) => emit(const AddressManagementError(
            'Could not load your saved addresses.',
          )),
        );
  }

  Future<bool> addAddress({
    required String fullName,
    required String phone,
    required String addressLine,
    required String city,
  }) async {
    final uid = _currentUser.uid;
    if (uid == null) return false;

    final currentCount =
        state is AddressManagementLoaded ? (state as AddressManagementLoaded).addresses.length : 0;

    final result = await _addUseCase(
      uid,
      AddressEntity(
        id: '',
        fullName: fullName,
        phone: phone,
        addressLine: addressLine,
        city: city,
        isDefault: currentCount == 0,
      ),
    );

    return result.fold((failure) => false, (_) => true);
  }

  Future<void> deleteAddress(String addressId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _deleteUseCase(uid, addressId);
  }

  Future<void> setDefault(String addressId) async {
    final uid = _currentUser.uid;
    if (uid == null) return;
    await _setDefaultUseCase(uid, addressId);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
