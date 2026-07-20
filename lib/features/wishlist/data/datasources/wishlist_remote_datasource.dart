import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Reads/writes `users/{uid}/wishlist/{productId}` documents. Each
/// document's existence *is* the favorite — we only ever store
/// `{addedAt}`, since the product's own data (name/price/image) always
/// comes fresh from the catalog, never duplicated into the wishlist
/// document.
class WishlistRemoteDataSource {
  WishlistRemoteDataSource(this._firestore);
  final FirebaseFirestore? _firestore;

  bool get _isConfigured => _firestore != null;

  // Local memory for mock mode
  final _mockWishlist = <String, Set<String>>{};
  final _mockStreamController = StreamController<Set<String>>.broadcast();

  CollectionReference<Map<String, dynamic>> _wishlistRef(String uid) =>
      _firestore!.collection('users').doc(uid).collection('wishlist');

  Stream<Set<String>> watchWishlistIds(String uid) {
    if (!_isConfigured) {
      // In mock mode, initialize with empty if not present and emit
      _mockWishlist[uid] ??= {};
      // Emit current value immediately AND on every subsequent change
      Timer.run(() => _mockStreamController.add(_mockWishlist[uid]!));
      return _mockStreamController.stream;
    }
    
    return _wishlistRef(uid)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toSet());
  }

  Future<void> addToWishlist(String uid, String productId) async {
    if (!_isConfigured) {
      _mockWishlist[uid] ??= {};
      _mockWishlist[uid]!.add(productId);
      _mockStreamController.add(Set.from(_mockWishlist[uid]!));
      return;
    }
    
    return _wishlistRef(uid).doc(productId).set({
      'addedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<void> removeFromWishlist(String uid, String productId) async {
    if (!_isConfigured) {
      _mockWishlist[uid]?.remove(productId);
      _mockStreamController.add(Set.from(_mockWishlist[uid] ?? {}));
      return;
    }

    return _wishlistRef(uid).doc(productId).delete();
  }
}
