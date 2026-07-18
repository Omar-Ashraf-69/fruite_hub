import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUserData(String uid);
  Future<bool> isUserExists(String uid);
}
