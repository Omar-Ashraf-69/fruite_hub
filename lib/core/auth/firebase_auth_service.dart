import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService({required this._instance});

  final FirebaseAuth _instance;
  User? get currentUser => _instance.currentUser;

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

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await _instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow    
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize();
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
