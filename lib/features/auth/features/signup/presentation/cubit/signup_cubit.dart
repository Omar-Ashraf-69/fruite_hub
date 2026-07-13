import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/core/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.repo}) : super(SignUpInitial());

  final AuthRepo repo;

  void signup({
    required String email,
    required String pass,
    required String name,
  }) async {
    emit(SignUpLoading());
    final response = await repo.createUserWithEmailAndPassword(
      emailAddress: email,
      password: pass,
      name: name,
    );
    response.fold(
      (error) => emit(SignUpFailure(message: error.message)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }
}
