part of 'address_management_cubit.dart';

sealed class AddressManagementState extends Equatable {
  const AddressManagementState();

  @override
  List<Object?> get props => [];
}

class AddressManagementLoading extends AddressManagementState {
  const AddressManagementLoading();
}

class AddressManagementLoaded extends AddressManagementState {
  const AddressManagementLoaded(this.addresses);
  final List<AddressEntity> addresses;

  @override
  List<Object?> get props => [addresses];
}

class AddressManagementError extends AddressManagementState {
  const AddressManagementError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
