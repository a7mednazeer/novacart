import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/current_user_service.dart';

/// Deliberately minimal — a feedback submission is a single write with
/// no read/stream/state to manage, so a full repository+cubit layer
/// would be pure ceremony. Kept in `features/profile/data` rather than
/// `core/services` since it's specific to the Feedback screen, not
/// cross-cutting infrastructure.
class FeedbackService {
  FeedbackService(this._firestore, this._currentUser);

  final FirebaseFirestore _firestore;
  final CurrentUserService _currentUser;

  Future<void> submit(String message) {
    return _firestore.collection('feedback').add({
      'uid': _currentUser.uid,
      'message': message,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }
}
