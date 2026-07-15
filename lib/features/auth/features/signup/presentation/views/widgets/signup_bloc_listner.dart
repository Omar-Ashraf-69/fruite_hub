import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/loading_dialog.dart';
import 'package:fruit_hub/core/func/setup_error_state.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/cubit/signup_state.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignUpBlocListner extends StatelessWidget {
  const SignUpBlocListner({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpFailure,
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pop();
          setupSignUpSuccessState(context, state.user);
        } else if (state is SignUpFailure) {
          setupErrorState(context, state.message);
        } else {
          loadingDialog(context);
        }
      },
      child: child,
    );
  }

  Future<dynamic> setupSignUpSuccessState(
    BuildContext context,
    UserEntity user,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.done_outline_rounded,
          color: Colors.green,
          size: 32,
        ),
        content: Text(
          "${S.of(context).welcome} ${user.name} ${S.of(context).to_fruit_hub}",
          style: TextStyles.bold16,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
              context.pushNamedAndRemoveAll(AppRoutes.login);
            },
            child: Text(
              S.of(context).sign_in_now,
              style: TextStyles.semiBold13,
            ),
          ),
        ],
      ),
    );
  }
}
