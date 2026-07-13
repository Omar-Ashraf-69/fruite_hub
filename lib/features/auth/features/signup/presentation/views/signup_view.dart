import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/dont_have_an_account_row.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/signup_app_bar.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/signup_bloc_listner.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/signup_text_field_section.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/terms_and_conditions_form_field.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SignUpBlocListner(child: const SignUpViewBody())),
    );
  }
}

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final _nameFocusNode = FocusNode();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    _nameFocusNode.dispose();
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
              const SignUpAppBar(),
              verticalSpace(24),
              SignUpTextFieldSection(
                emailController: _emailController,
                nameController: _nameController,
                passwordController: _passwordController,
                nameFocusNode: _nameFocusNode,
                emailFocusNode: _emailFocusNode,
                passwordFocusNode: _passwordFocusNode,
                onSubmit: () => _submit(),
              ),
              verticalSpace(20),
              const TermsAndConditionsFormField(),

              verticalSpace(24),
              CustomButtonWidget(
                title: S.of(context).sing_up,
                onPressed: _submit,
              ),
              verticalSpace(24),
              CheckingHaveAccountRowTextWidget(
                title: S.of(context).already_have_an_account,
                subTilte: S.of(context).login,
                onTap: () {
                  context.pop();
                },
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
    context.read<SignUpCubit>().signup(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      pass: _passwordController.text,
    );
  }
}
