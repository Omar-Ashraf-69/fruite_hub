import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';



class UserModel {
  final String uid;
  final String name;
  final String email;
  UserModel({required this.uid, required this.name, required this.email});

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email, uId: uid,
    );
  }


  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uId'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uid: user.uId,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uid,
    };
  }
}
