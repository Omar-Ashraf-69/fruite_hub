import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/auth/auth_remote_data_source.dart';
import 'package:fruit_hub/core/auth/firebase_auth_service.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/firebase_exception_mapper.dart';
import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';
import 'package:fruit_hub/generated/l10n.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService firebaseAuthService;

  AuthRemoteDataSourceImpl({required this.firebaseAuthService});

  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final firebaseUser = await firebaseAuthService
          .createUserWithEmailAndPassword(email: email, password: password);

      return UserModel(name: name, email: email, uid: firebaseUser.uid);
    } on FirebaseAuthException catch (e, stackTrace) {
      log('FirebaseAuthException: ${e.code}', stackTrace: stackTrace);

      throw CustomException(
        message: FirebaseExceptionMapper.mapAuthException(e.code),
      );
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      throw CustomException(message: S.current.unexpected_error);
    }
  }

  @override
  Future<void> deleteCurrentUser() async {
    await firebaseAuthService.deleteCurrentUser();
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final firebaseUser = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        email: email,
        uid: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
      );
    } on FirebaseAuthException catch (e, stackTrace) {
      log('FirebaseAuthException: ${e.code}', stackTrace: stackTrace);

      throw CustomException(
        message: FirebaseExceptionMapper.mapAuthException(e.code),
      );
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      throw CustomException(message: S.current.unexpected_error);
    }
  }

  @override
  Future<UserModel> signInWithGoogle() {
    try {
      final firebaseUser = firebaseAuthService.signInWithGoogle();
      return firebaseUser.then(
        (value) => UserModel(
          email: value.user?.email ?? '',
          uid: value.user!.uid,
          name: value.user?.displayName ?? '',
        ),
      );
    } on FirebaseAuthException catch (e, stackTrace) {
      log('FirebaseAuthException: ${e.code}', stackTrace: stackTrace);

      throw CustomException(
        message: FirebaseExceptionMapper.mapAuthException(e.code),
      );
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      throw CustomException(message: S.current.unexpected_error);
    }
  }
}
