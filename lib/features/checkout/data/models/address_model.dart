import '../../domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    required super.fullName,
    required super.phone,
    required super.addressLine,
    required super.city,
    super.isDefault,
  });

  factory AddressModel.fromFirestore(String id, Map<String, dynamic> data) {
    return AddressModel(
      id: id,
      fullName: data['fullName'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      addressLine: data['addressLine'] as String? ?? '',
      city: data['city'] as String? ?? '',
      isDefault: data['isDefault'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'fullName': fullName,
      'phone': phone,
      'addressLine': addressLine,
      'city': city,
      'isDefault': isDefault,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
