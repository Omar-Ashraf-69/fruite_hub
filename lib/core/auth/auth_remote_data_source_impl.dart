import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/auth/auth_remote_data_source.dart';
import 'package:fruit_hub/core/auth/firebase_auth_service.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/firebase_exception_mapper.dart';
import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService firebaseAuthService;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuthService,
  });

  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final firebaseUser =
          await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel(
        name: name,
        email: email,
        uid: firebaseUser.uid,
      );
    } on FirebaseAuthException catch (e, stackTrace) {
      log(
        'FirebaseAuthException: ${e.code}',
        stackTrace: stackTrace,
      );

      throw  CustomException(
        message: FirebaseExceptionMapper.mapAuthException(e.code),
      );
    } catch (e, stackTrace) {
      log(
        e.toString(),
        stackTrace: stackTrace,
      );
      throw  CustomException(
        message: 'حدث خطأ ما، الرجاء المحاولة مرة أخرى.',
      );
    }
  }

  @override
  Future<void> deleteCurrentUser() async {
    await firebaseAuthService.deleteCurrentUser();
  }

  // ignore: unused_element
  String _mapFirebaseAuthException(String code) {
    switch (code) {
      case 'weak-password':
        return 'كلمة المرور ضعيفة جداً.';

      case 'email-already-in-use':
        return 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.';

      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح.';

      case 'network-request-failed':
        return 'تأكد من اتصالك بالإنترنت.';

      case 'operation-not-allowed':
        return 'عملية إنشاء الحساب غير متاحة حالياً.';

      case 'too-many-requests':
        return 'تمت المحاولة عدة مرات. الرجاء المحاولة لاحقاً.';

      default:
        return 'حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.';
    }
  }
}