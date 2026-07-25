import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cart_item_model.dart';

/// Reads/writes `users/{uid}/cart/{productId}` and
/// `users/{uid}/savedForLater/{productId}`. Moving an item between the
/// two is a read-then-write-then-delete since Firestore has no
/// built-in "move document" operation.
class CartRemoteDataSource {
  CartRemoteDataSource(this._firestore);
  final FirebaseFirestore? _firestore;

  bool get _isConfigured => _firestore != null;

  // Local memory for mock mode
  final _mockCart = <String, Map<String, CartItemModel>>{};
  final _mockSaved = <String, Map<String, CartItemModel>>{};
  final _cartController = StreamController<List<CartItemModel>>.broadcast();
  final _savedController = StreamController<List<CartItemModel>>.broadcast();

  CollectionReference<Map<String, dynamic>> _cartRef(String uid) =>
      _firestore!.collection('users').doc(uid).collection('cart');

  CollectionReference<Map<String, dynamic>> _savedRef(String uid) =>
      _firestore!.collection('users').doc(uid).collection('savedForLater');

  Stream<List<CartItemModel>> watchCart(String uid) async* {
    if (!_isConfigured) {
      _mockCart[uid] ??= {};
      // Yield current state immediately so the Cubit doesn't hang in loading
      yield _mockCart[uid]!.values.toList();
      yield* _cartController.stream;
      return;
    }
    
    yield* _cartRef(uid).snapshots().map((snapshot) => snapshot.docs
        .map((doc) => CartItemModel.fromFirestore(doc.id, doc.data()))
        .toList());
  }

  Stream<List<CartItemModel>> watchSavedForLater(String uid) async* {
    if (!_isConfigured) {
      _mockSaved[uid] ??= {};
      yield _mockSaved[uid]!.values.toList();
      yield* _savedController.stream;
      return;
    }
    
    yield* _savedRef(uid).snapshots().map((snapshot) => snapshot.docs
        .map((doc) => CartItemModel.fromFirestore(doc.id, doc.data()))
        .toList());
  }

  Future<void> addOrUpdateItem(String uid, CartItemModel item) async {
    if (!_isConfigured) {
      _mockCart[uid] ??= {};
      _mockCart[uid]![item.productId] = item;
      _cartController.add(_mockCart[uid]!.values.toList());
      return;
    }
    return _cartRef(uid).doc(item.productId).set(item.toFirestore());
  }

  Future<void> updateQuantity(String uid, String productId, int quantity) async {
    if (!_isConfigured) {
      final item = _mockCart[uid]?[productId];
      if (item != null) {
        _mockCart[uid]![productId] = CartItemModel(
          productId: productId,
          quantity: quantity,
          selectedColor: item.selectedColor,
          selectedSize: item.selectedSize,
        );
        _cartController.add(_mockCart[uid]!.values.toList());
      }
      return;
    }
    return _cartRef(uid).doc(productId).update({
      'quantity': quantity,
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<void> removeItem(String uid, String productId) async {
    if (!_isConfigured) {
      _mockCart[uid]?.remove(productId);
      _mockSaved[uid]?.remove(productId);
      _cartController.add(_mockCart[uid]?.values.toList() ?? []);
      _savedController.add(_mockSaved[uid]?.values.toList() ?? []);
      return;
    }
    return _cartRef(uid).doc(productId).delete();
  }

  Future<void> moveToSavedForLater(String uid, String productId) async {
    if (!_isConfigured) {
      final item = _mockCart[uid]?.remove(productId);
      if (item != null) {
        _mockSaved[uid] ??= {};
        _mockSaved[uid]![productId] = item;
        _cartController.add(_mockCart[uid]!.values.toList());
        _savedController.add(_mockSaved[uid]!.values.toList());
      }
      return;
    }
    
    final doc = await _cartRef(uid).doc(productId).get();
    if (!doc.exists) return;

    await _savedRef(uid).doc(productId).set(doc.data()!);
    await _cartRef(uid).doc(productId).delete();
  }

  Future<void> moveToCart(String uid, String productId) async {
    if (!_isConfigured) {
      final item = _mockSaved[uid]?.remove(productId);
      if (item != null) {
        _mockCart[uid] ??= {};
        _mockCart[uid]![productId] = item;
        _cartController.add(_mockCart[uid]!.values.toList());
        _savedController.add(_mockSaved[uid]!.values.toList());
      }
      return;
    }
    
    final doc = await _savedRef(uid).doc(productId).get();
    if (!doc.exists) return;

    await _cartRef(uid).doc(productId).set(doc.data()!);
    await _savedRef(uid).doc(productId).delete();
  }

  Future<void> clearCart(String uid) async {
    if (!_isConfigured) {
      _mockCart[uid]?.clear();
      _cartController.add([]);
      return;
    }
    
    final snapshot = await _cartRef(uid).get();
    final batch = _firestore!.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
