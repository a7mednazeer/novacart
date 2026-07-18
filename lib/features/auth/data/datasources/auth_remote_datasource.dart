import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:google_sign_in/google_sign_in.dart' as google;

import '../models/user_model.dart';

/// Talks directly to Firebase Auth / Firestore. This is the *only*
/// place in the whole app allowed to import `firebase_auth` for
/// authentication purposes — everything above (repository, use cases,
/// cubits, UI) only ever sees [UserModel]/`UserEntity` and
/// `Either<Failure, T>`.
///
/// Methods throw the raw [fb.FirebaseAuthException] on failure; the
/// repository implementation is responsible for catching it and
/// mapping it to a domain [Failure] with a friendly message.
class AuthRemoteDataSource {
  AuthRemoteDataSource({
    required fb.FirebaseAuth? firebaseAuth,
    required FirebaseFirestore? firestore,
    required google.GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  final fb.FirebaseAuth? _firebaseAuth;
  final FirebaseFirestore? _firestore;
  final google.GoogleSignIn _googleSignIn;

  bool get _isConfigured => _firebaseAuth != null && _firestore != null;

  fb.FirebaseAuth get _auth => _firebaseAuth!;
  FirebaseFirestore get _db => _firestore!;

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _db.collection('users');

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    if (!_isConfigured) return _mockUser(email: email);

    final credential = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = credential.user!;
    final doc = await _usersCollection.doc(user.uid).get();
    return UserModel.fromFirebaseUser(user, firestoreData: doc.data());
  }

  Future<UserModel> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    if (!_isConfigured) return _mockUser(email: email, name: fullName);

    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = credential.user!;
    await user.updateDisplayName(fullName);

    final model = UserModel.fromFirebaseUser(user).copyWithName(fullName);
    await _usersCollection.doc(user.uid).set(model.toFirestore());
    await user.sendEmailVerification();

    return model;
  }

  Future<UserModel> signInWithGoogle() async {
    if (!_isConfigured) return _mockUser(name: 'Google User');

    try {
      final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = fb.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user!;

      final docRef = _usersCollection.doc(user.uid);
      final doc = await docRef.get();
      final model = UserModel.fromFirebaseUser(user, firestoreData: doc.data());

      if (!doc.exists) {
        await docRef.set(model.toFirestore());
      }

      return model;
    } on fb.FirebaseAuthException {
      rethrow;
    } catch (e) {
      throw fb.FirebaseAuthException(
        code: 'google-sign-in-error',
        message: e.toString(),
      );
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    if (!_isConfigured) return;
    await _auth.sendPasswordResetEmail(email: email.trim());
  }

  Future<void> sendEmailVerification() async {
    if (!_isConfigured) return;
    final user = _firebaseAuth?.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> signOut() async {
    await Future.wait([
      if (_isConfigured) _firebaseAuth!.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<UserModel?> getCurrentUser() async {
    if (!_isConfigured) return null;
    final user = _firebaseAuth?.currentUser;
    if (user == null) return null;
    final doc = await _usersCollection.doc(user.uid).get();
    return UserModel.fromFirebaseUser(user, firestoreData: doc.data());
  }

  UserModel _mockUser({String? email, String? name}) {
    return UserModel(
      uid: 'mock-uid-123',
      email: email ?? 'test@example.com',
      fullName: name ?? 'NovaCart User',
      isEmailVerified: true,
    );
  }
}

extension on UserModel {
  UserModel copyWithName(String name) {
    return UserModel(
      uid: uid,
      email: email,
      fullName: name,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
      isEmailVerified: isEmailVerified,
    );
  }
}
