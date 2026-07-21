import 'dart:convert';
import 'package:fruit_hub/core/constants/pref_keys.dart';
import 'package:fruit_hub/core/helpers/shared_pref_helper.dart';
import 'package:fruit_hub/features/auth/core/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';

class LocalUserDataSource {
  static UserEntity getLocalUserData() {
    final json = SharedPrefHelper.getString(PrefKeys.kUserData) ?? '';
    return UserModel.fromJson(jsonDecode(json)).toEntity();
  }

  static Future<void> saveUserLocally(UserModel user) async {
    final json = jsonEncode(user.toJson());
    await SharedPrefHelper.setData(PrefKeys.kUserData, json);
  }

  static Future<void> removeUserLocally() async {
    await SharedPrefHelper.removeData(PrefKeys.kUserData);
  }


  static Future<bool> checkUserExists() async {
    final json = SharedPrefHelper.getString(PrefKeys.kUserData) ?? '';
    return json.isNotEmpty;
  }
}
