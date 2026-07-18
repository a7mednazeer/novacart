import 'package:equatable/equatable.dart';

/// Pure domain representation of an authenticated user — deliberately
/// has zero dependency on `firebase_auth`. The domain/presentation
/// layers only ever see this entity; only `data/` knows Firebase
/// exists, so swapping auth providers later never touches business
/// logic or UI.
class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.email,
    required this.fullName,
    this.phoneNumber,
    this.photoUrl,
    this.isEmailVerified = false,
  });

  final String uid;
  final String email;
  final String fullName;
  final String? phoneNumber;
  final String? photoUrl;
  final bool isEmailVerified;

  @override
  List<Object?> get props =>
      [uid, email, fullName, phoneNumber, photoUrl, isEmailVerified];
}
