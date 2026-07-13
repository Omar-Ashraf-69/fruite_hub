import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/setup_error_state.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/auth/core/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/cubit/signup_state.dart';

class SignUpBlocListner extends StatelessWidget {
  const SignUpBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpFailure,
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
        if (state is SignUpSuccess) {
          setupSignUpSuccessState(context, state.user);
        } else if (state is SignUpFailure) {
          setupErrorState(context, state.message);
        }
      },
      child: SizedBox.shrink(),
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
          "Welcome ${user.name} to Fruit Hub",
          style: TextStyles.bold16,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
              context.pushNamedAndRemoveAll(AppRoutes.login);
            },
            child: Text('Sing In Now', style: TextStyles.semiBold13),
          ),
        ],
      ),
    );
  }
}
