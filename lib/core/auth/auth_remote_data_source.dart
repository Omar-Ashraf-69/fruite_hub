import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> deleteCurrentUser();

  Future<UserModel> signInWithGoogle();

  Future<UserModel> signInWithFacebook();
}
