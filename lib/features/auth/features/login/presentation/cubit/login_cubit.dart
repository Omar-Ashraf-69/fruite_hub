import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/core/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repo}) : super(LoginInitial());

  final AuthRepo repo;

  void login({
    required String email,
    required String pass,
  }) async {
    emit(LoginLoading());
    final response = await repo.signInWithEmailAndPassword(
      emailAddress: email,
      password: pass,
    );
    response.fold(
      (error) => emit(LoginFailure(message: error.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  void loginWithGoogle() async {
    emit(LoginLoading());
    final response = await repo.signInWithGoogle();
    response.fold(
      (error) => emit(LoginFailure(message: error.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }
}
