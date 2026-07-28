import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/loading_dialog.dart';
import 'package:fruit_hub/core/func/setup_error_state.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {
          loadingDialog(context);
        }
        if (state is LoginSuccess) {
          context.pop();
          context.pushNamedAndRemoveAll(AppRoutes.main);
        } else if (state is LoginFailure) {
          setupErrorState(context, state.message);
        }
      },
      child: child,
    );
  }
}
