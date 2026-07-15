import 'dart:core';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/firebase_exception_mapper.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService({
    required this._instance,
    required this.googleSignIn,
    required this.facebookAuth,
  });
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookAuth;
  final FirebaseAuth _instance;
  User? get currentUser => _instance.currentUser;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _execute(() async {
      final credential = await _instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    });
  }

  Future<void> deleteCurrentUser() async {
    return _execute(() async {
      await _instance.currentUser?.delete();
    });
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _execute(() async {
      final credential = await _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    return _execute(() async {
      await googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return _instance.signInWithCredential(credential);
    });
  }

  // Future<void> signOut() async {
  //   return _execute(() async {
  //     await _instance.signOut();
  //     await googleSignIn.signOut();
  //   });
  // }

  Future<UserCredential> signInWithFacebook() async {
    return _execute(() async {
      final result = await facebookAuth.login();
      return await facebookSignInWithCredentialState(result);
    });
  }

  Future<void> signOutFromFacebook() async {
    return _execute(() async {
      await facebookAuth.logOut();
    });
  }

  Future<void> signOut() {
    return _execute(() async {
      await Future.wait([
        _instance.signOut(),
        googleSignIn.signOut(),
        facebookAuth.logOut(),
      ]);
    });
  }

  Future<T> _execute<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on FirebaseAuthException catch (e, stackTrace) {
      log('FirebaseAuthException: ${e.code}', stackTrace: stackTrace);

      throw CustomException(
        message: FirebaseExceptionMapper.mapAuthException(e.code),
      );
    } on GoogleSignInException catch (e, stackTrace) {
      log('GoogleSignInException: ${e.code}', error: e, stackTrace: stackTrace);
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw CustomException(message: S.current.google_sign_in_cancelled);
      }
      throw CustomException(message: S.current.unexpected_error);
    } on CustomException {
      rethrow;
    } catch (e, stackTrace) {
      log(
        'Unexpected error in FirebaseAuthService',
        error: e,
        stackTrace: stackTrace,
      );
      throw CustomException(message: S.current.unexpected_error);
    }
  }

  Future<UserCredential> facebookSignInWithCredentialState(
    LoginResult result,
  ) async {
    if (result.status case LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.tokenString,
      );

      return await _instance.signInWithCredential(credential);
    } else if (result.status case LoginStatus.cancelled) {
      throw CustomException(message: S.current.facebook_sign_in_cancelled);
    } else if (result.status case LoginStatus.failed) {
      throw CustomException(
        message: result.message ?? S.current.unexpected_error,
      );
    } else {
      throw CustomException(message: S.current.unexpected_error);
    }
  }
}
