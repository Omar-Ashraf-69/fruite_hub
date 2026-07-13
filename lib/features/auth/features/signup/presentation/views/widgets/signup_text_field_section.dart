import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/helpers/validators.dart';
import 'package:fruit_hub/core/widgets/custom_form_field.dart';
import 'package:fruit_hub/core/widgets/custom_pass_form_field.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignUpTextFieldSection extends StatelessWidget {
  const SignUpTextFieldSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.nameFocusNode,
    required this.onSubmit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode nameFocusNode;

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormField(
          controller: nameController,
          hintText: S.of(context).enter_your_name,
          validator: AppValidators.validateName,
          focusNode: nameFocusNode,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(emailFocusNode);
          },
        ),
        verticalSpace(24),
        CustomFormField(
          controller: emailController,
          validator: AppValidators.validateEmail,
          hintText: S.of(context).enter_your_email_address,
          focusNode: emailFocusNode,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
        ),
        verticalSpace(24),
        CustomPassFormField(
          controller: passwordController,
          validator: AppValidators.validatePassword,
          focusNode: passwordFocusNode,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            onSubmit();
          },
        ),
      ],
    );
  }
}
