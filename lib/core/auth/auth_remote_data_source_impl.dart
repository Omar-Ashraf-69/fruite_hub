import 'package:fruit_hub/core/auth/auth_remote_data_source.dart';
import 'package:fruit_hub/core/auth/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService firebaseAuthService;

  AuthRemoteDataSourceImpl({required this.firebaseAuthService});

  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    final user = await firebaseAuthService.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel(name: name, email: email, uid: user.uid);
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
    final user = await firebaseAuthService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel(email: email, uid: user.uid, name: user.displayName ?? '');
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final credential = await firebaseAuthService.signInWithGoogle();
    return UserModel.toUserModel(credential.user!);
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    final credential = await firebaseAuthService.signInWithFacebook();
    return UserModel.toUserModel(credential.user!);
  }
}
