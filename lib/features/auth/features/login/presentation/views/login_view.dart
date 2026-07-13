import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/dont_have_an_account_row.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/forget_pass_text.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/login_bloc_listener.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/login_text_fields_sections.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/sign_in_with_social_button.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginBlocListener(child: const LoginViewBody())),
    );
  }
}

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            children: [
              Text(S.of(context).login, style: TextStyles.bold19),
              verticalSpace(24),
              LoginTextFieldsSection(
                emailController: _emailController,
                passwordController: _passwordController,
                emailFocusNode: _emailFocusNode,
                passwordFocusNode: _passwordFocusNode,
                submit: (_) => _submit(),
              ),
              verticalSpace(20),
              const ForgetPassWidget(),
              verticalSpace(24),
              CustomButtonWidget(
                title: S.of(context).login,
                onPressed: _submit,
              ),
              verticalSpace(24),
              CheckingHaveAccountRowTextWidget(
                title: S.of(context).dont_have_account,
                subTilte: S.of(context).sing_up,
                onTap: () {
                  context.pushNamed(AppRoutes.signup);
                },
              ),
              verticalSpace(28),
              const CustomDividerWidget(),
              verticalSpace(28),
              SignButtonWidget(
                icon: Assets.svgsGoogleIcon,
                buttonLabel: S.of(context).login_with_google,
              ),
              verticalSpace(32),
              SignButtonWidget(
                icon: Assets.svgsFacebookIcon,
                buttonLabel: S.of(context).login_with_facebook,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _autoValidateMode = AutovalidateMode.onUserInteraction;
      });
      return;
    }
    context.read<LoginCubit>().login(
      email: _emailController.text.trim(),
      pass: _passwordController.text,
    );
  }
}
