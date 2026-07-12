import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_form_field.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/signup_app_bar.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/terms_and_conditions.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SignUpViewBody()));
  }
}

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignUpAppBar(),
            verticalSpace(24),
            CustomFormField(hintText: S.of(context).enter_your_name),
            verticalSpace(24),
            CustomFormField(hintText: S.of(context).enter_your_email_address),
            verticalSpace(24),
            CustomPassFormField(),
            verticalSpace(20),
            TermsAndConditionsTextWidget(),
            verticalSpace(24),
            CustomButtonWidget(title: S.of(context).sing_up, onPressed: () {}),
            verticalSpace(24),
            DontHaveAccountRowTextWidget(
              title: S.of(context).already_have_an_account,
              subTilte: S.of(context).login,
              onTap: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
