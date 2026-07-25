import 'package:cloud_firestore/cloud_firestore.dart';

/// Each document id *is* the product id (so re-viewing a product just
/// overwrites its `viewedAt` instead of creating duplicates), queried
/// ordered by `viewedAt` descending and capped to the most recent N.
class RecentlyViewedRemoteDataSource {
  RecentlyViewedRemoteDataSource(this._firestore);
  final FirebaseFirestore _firestore;

  static const int _maxTracked = 15;

  CollectionReference<Map<String, dynamic>> _ref(String uid) =>
      _firestore.collection('users').doc(uid).collection('recentlyViewed');

  Stream<List<String>> watchRecentlyViewedIds(String uid) {
    return _ref(uid)
        .orderBy('viewedAt', descending: true)
        .limit(_maxTracked)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }

  Future<void> recordView(String uid, String productId) {
    return _ref(uid).doc(productId).set({
      'viewedAt': DateTime.now().toIso8601String(),
    });
  }
}
