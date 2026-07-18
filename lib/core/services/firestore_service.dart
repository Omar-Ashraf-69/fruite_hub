import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/constants/endpoints.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/firebase_firestore_exception_mapper.dart';
import 'package:fruit_hub/core/services/user_remote_data_source.dart';
import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FirestoreService implements UserRemoteDataSource {
  FirestoreService(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<void> saveUser(UserModel user) {
    return _execute(() {
      return _firestore
          .collection(BackendEndpoints.saveUser)
          .doc(user.uid)
          .set(user.toJson());
    });
  }

  @override
  Future<UserModel?> getUserData(String uid) {
    return _execute(() async {
      final doc = await _firestore
          .collection(BackendEndpoints.getUser)
          .doc(uid)
          .get();
      if (!doc.exists) {
        return null;
      }
      return UserModel.fromJson(doc.data()!);
    });
  }

  @override
  Future<bool> isUserExists(String uid) async {
    return _execute(() async {
      final doc = await _firestore
          .collection(BackendEndpoints.saveUser)
          .doc(uid)
          .get();
      return doc.exists;
    });
  }

  Future<T> _execute<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on FirebaseException catch (e, stackTrace) {
      log('FirestoreException: ${e.code}', error: e, stackTrace: stackTrace);
      throw CustomException(message: FirestoreExceptionMapper.map(e.code));
    } on CustomException {
      log('CustomException in FirestoreService');
      rethrow;
    } catch (e, stackTrace) {
      log('Unexpected Firestore error', error: e, stackTrace: stackTrace);
      throw CustomException(message: S.current.unexpected_error);
    }
  }
}
