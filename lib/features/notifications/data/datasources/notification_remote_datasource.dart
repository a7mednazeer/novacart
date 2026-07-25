import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationRemoteDataSource {
  NotificationRemoteDataSource(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _ref(String uid) =>
      _firestore.collection('users').doc(uid).collection('notifications');

  Stream<List<NotificationModel>> watchNotifications(String uid) {
    return _ref(uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotificationModel.fromFirestore(doc.id, doc.data()))
            .toList());
  }

  Future<void> markAsRead(String uid, String notificationId) {
    return _ref(uid).doc(notificationId).update({'isRead': true});
  }

  Future<void> markAllAsRead(String uid) async {
    final snapshot = await _ref(uid).where('isRead', isEqualTo: false).get();
    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.update(doc.reference, {'isRead': true});
    }
    await batch.commit();
  }

  Future<void> deleteNotification(String uid, String notificationId) {
    return _ref(uid).doc(notificationId).delete();
  }

  Future<void> addNotifications(String uid, List<NotificationModel> notifications) async {
    final batch = _firestore.batch();
    for (final notification in notifications) {
      batch.set(_ref(uid).doc(), notification.toFirestore());
    }
    await batch.commit();
  }
}
