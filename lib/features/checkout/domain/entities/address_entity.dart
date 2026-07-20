import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  const AddressEntity({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.addressLine,
    required this.city,
    this.isDefault = false,
  });

  final String id;
  final String fullName;
  final String phone;
  final String addressLine;
  final String city;
  final bool isDefault;

  @override
  List<Object?> get props => [id, fullName, phone, addressLine, city, isDefault];
}
