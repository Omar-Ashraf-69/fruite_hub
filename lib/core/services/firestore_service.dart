import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/firebase_firestore_exception_mapper.dart';
import 'package:fruit_hub/core/services/data_service.dart';
import 'package:fruit_hub/generated/l10n.dart';


class FirestoreService implements DatabaseService {
  FirestoreService(this._firestore);

  final FirebaseFirestore _firestore;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    return _execute(() async {
      if (documentId != null) {
        await _firestore.collection(path).doc(documentId).set(data);
      } else {
        await _firestore.collection(path).add(data);
      }
    });
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  }) async {
    return _execute(() async {
      if (docuementId != null) {
        final snapshot = await _firestore
            .collection(path)
            .doc(docuementId)
            .get();

        return snapshot.data();
      }

      Query<Map<String, dynamic>> request = _firestore.collection(path);

      if (query != null) {
        if (query['orderBy'] != null) {
          request = request.orderBy(
            query['orderBy'],
            descending: query['descending'] ?? false,
          );
        }

        if (query['limit'] != null) {
          request = request.limit(query['limit']);
        }
      }

      final result = await request.get();

      return result.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  }) async {
    return _execute(() async {
      final doc = await _firestore.collection(path).doc(docuementId).get();
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
