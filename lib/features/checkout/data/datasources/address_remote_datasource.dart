import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/address_model.dart';

class AddressRemoteDataSource {
  AddressRemoteDataSource(this._firestore);
  final FirebaseFirestore? _firestore;

  bool get _isConfigured => _firestore != null;

  // Local memory for mock mode
  final _mockAddresses = <String, Map<String, AddressModel>>{};
  final _addressControllers = <String, StreamController<List<AddressModel>>>{};

  StreamController<List<AddressModel>> _getController(String uid) {
    return _addressControllers.putIfAbsent(
      uid,
      () => StreamController<List<AddressModel>>.broadcast(),
    );
  }

  CollectionReference<Map<String, dynamic>> _addressesRef(String uid) =>
      _firestore!.collection('users').doc(uid).collection('addresses');

  Stream<List<AddressModel>> watchAddresses(String uid) {
    if (!_isConfigured) {
      _mockAddresses[uid] ??= {};
      final controller = _getController(uid);
      // Emit current state immediately to the new listener
      Timer.run(() => controller.add(_mockAddresses[uid]!.values.toList()));
      return controller.stream;
    }
    
    return _addressesRef(uid).snapshots().map((snapshot) => snapshot.docs
        .map((doc) => AddressModel.fromFirestore(doc.id, doc.data()))
        .toList());
  }

  Future<String> addAddress(String uid, AddressModel address) async {
    if (!_isConfigured) {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _mockAddresses[uid] ??= {};
      
      final isFirst = _mockAddresses[uid]!.isEmpty;
      final newAddress = AddressModel(
        id: id,
        fullName: address.fullName,
        phone: address.phone,
        addressLine: address.addressLine,
        city: address.city,
        isDefault: isFirst || address.isDefault,
      );

      if (newAddress.isDefault) {
        _mockAddresses[uid]!.forEach((key, value) {
          _mockAddresses[uid]![key] = value.copyWith(isDefault: false);
        });
      }

      _mockAddresses[uid]![id] = newAddress;
      _getController(uid).add(_mockAddresses[uid]!.values.toList());
      return id;
    }
    
    final ref = await _addressesRef(uid).add(address.toFirestore());
    return ref.id;
  }

  Future<void> deleteAddress(String uid, String addressId) async {
    if (!_isConfigured) {
      _mockAddresses[uid]?.remove(addressId);
      _getController(uid).add(_mockAddresses[uid]?.values.toList() ?? []);
      return;
    }
    return _addressesRef(uid).doc(addressId).delete();
  }

  Future<void> setDefaultAddress(String uid, String addressId) async {
    if (!_isConfigured) {
      if (_mockAddresses[uid] != null) {
        _mockAddresses[uid]!.forEach((key, value) {
          _mockAddresses[uid]![key] = value.copyWith(isDefault: key == addressId);
        });
        _getController(uid).add(_mockAddresses[uid]!.values.toList());
      }
      return;
    }
    
    final batch = _firestore!.batch();
    final snapshot = await _addressesRef(uid).get();

    for (final doc in snapshot.docs) {
      batch.update(doc.reference, {'isDefault': doc.id == addressId});
    }

    await batch.commit();
  }
}

extension on AddressModel {
  AddressModel copyWith({bool? isDefault}) {
    return AddressModel(
      id: id,
      fullName: fullName,
      phone: phone,
      addressLine: addressLine,
      city: city,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
