import 'package:firebase_auth/firebase_auth.dart';

/// A single, thin read-only accessor for "who is logged in right now."
/// Features like Wishlist and Cart need the current uid to build
/// Firestore paths (`users/{uid}/wishlist`, `users/{uid}/cart`) but
/// shouldn't each import `firebase_auth` directly — that stays
/// concentrated in the Auth feature's `AuthRemoteDataSource` for
/// anything auth-*logic*-related. This service is intentionally tiny:
/// it only ever reads the current uid, never signs in/out/up.
class CurrentUserService {
  CurrentUserService(this._auth);
  final FirebaseAuth? _auth;

  /// Returns the current Firebase user ID, or a mock ID if Firebase
  /// is not initialized/configured.
  String? get uid {
    if (_auth == null) return 'mock-uid-123';
    return _auth!.currentUser?.uid;
  }
}
