import 'package:firebase_auth/firebase_auth.dart' as fb;
import '../../domain/entities/user_entity.dart';

/// Data-layer representation of a user. Extends [UserEntity] so it can
/// be returned anywhere a `UserEntity` is expected, while adding the
/// Firebase-specific (de)serialization the domain layer shouldn't know
/// about.
class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.fullName,
    super.phoneNumber,
    super.photoUrl,
    super.isEmailVerified,
  });

  /// Builds a [UserModel] from the Firebase Auth user + an optional
  /// Firestore profile document (which holds fields Firebase Auth
  /// itself doesn't store, like a saved phone/address).
  factory UserModel.fromFirebaseUser(
    fb.User user, {
    Map<String, dynamic>? firestoreData,
  }) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? firestoreData?['email'] ?? '',
      fullName: firestoreData?['fullName'] as String? ??
          user.displayName ??
          'NovaCart User',
      phoneNumber: firestoreData?['phoneNumber'] as String? ??
          user.phoneNumber,
      photoUrl: firestoreData?['photoUrl'] as String? ?? user.photoURL,
      isEmailVerified: user.emailVerified,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
