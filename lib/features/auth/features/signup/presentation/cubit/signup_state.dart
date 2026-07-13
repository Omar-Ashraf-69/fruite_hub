import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';

class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserEntity user;
  SignUpSuccess( {required this.user});
}

class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure({required this.message});
}

class SignUpAutovalidateMode extends SignUpState {}