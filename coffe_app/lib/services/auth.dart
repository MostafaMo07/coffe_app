//ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthService._();
  static final AuthService _service = AuthService._();
  factory AuthService() => _service;

  static AuthService get instance => _service;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserCredential.user;
  }
}
