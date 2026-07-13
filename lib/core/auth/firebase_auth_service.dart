import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuthService({
    required this._instance,
  });

  final FirebaseAuth _instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await _instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user!;
  }

  Future<void> deleteCurrentUser() async {
    await _instance.currentUser?.delete();
  }
}