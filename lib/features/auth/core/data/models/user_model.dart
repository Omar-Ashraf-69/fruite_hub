import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';

class UserModel {
  final String uId;
  final String name;
  final String email;
  UserModel({required this.uId, required this.name, required this.email});

  UserEntity toEntity() {
    return UserEntity(name: name, email: email, uId: uId);
  }

  static UserModel toUserModel(User user) {
    return UserModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(name: user.name, email: user.email, uId: user.uId);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}
