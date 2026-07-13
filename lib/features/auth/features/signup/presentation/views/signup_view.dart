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
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/terms_and_conditions.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SignUpViewBody()));
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
  bool _acceptedTerms = false;

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
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            children: [
              SignUpAppBar(),
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
              FormField<bool>(
                initialValue: _acceptedTerms,
                validator: (value) {
                  if (value != true) {
                    return S.of(context).please_accept_terms_and_conditions;
                  }
                  return null;
                },
                builder: (field) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TermsAndConditionsTextWidget(
                        isAccepted: field.value ?? false,
                        onChanged: (value) {
                          field.didChange(value);

                          setState(() {
                            _acceptedTerms = value;
                          });
                        },
                      ),

                      if (field.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            field.errorText!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  );
                },
              ),

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
              SignUpBlocListner(),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // if (!_acceptedTerms) {
      //   final messenger = ScaffoldMessenger.of(context);

      //   messenger
      //     ..hideCurrentSnackBar()
      //     ..showSnackBar(
      //       SnackBar(
      //         content: Text(S.of(context).please_accept_terms_and_conditions),
      //       ),
      //     );
      //   return;
      // }
      context.read<SignUpCubit>().signup(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        pass: _passwordController.text,
      );
    }
    setState(() {
      _autoValidateMode = AutovalidateMode.onUserInteraction;
    });
  }
}
