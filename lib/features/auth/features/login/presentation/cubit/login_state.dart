import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;
  LoginSuccess( {required this.user});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

