import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/core/widgets/custom_form_field.dart';
import 'package:fruit_hub/core/widgets/custom_pass_form_field.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/dont_have_an_account_row.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/forget_pass_text.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/widgets/sign_in_with_social_button.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LoginViewBody()));
  }
}

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(verticalflutter pub add firebase_core: 18.h, horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(S.of(context).login, style: TextStyles.bold19),
            verticalSpace(24),
            CustomFormField(hintText: S.of(context).enter_your_email_address),
            verticalSpace(24),
            CustomPassFormField(),
            verticalSpace(20),
            ForgetPassWidget(),
            verticalSpace(24),
            CustomButtonWidget(title: S.of(context).login, onPressed: () {}),
            verticalSpace(24),
            CheckingHaveAccountRowTextWidget(
              title: S.of(context).dont_have_account,
              subTilte: S.of(context).sing_up,
              onTap: () {
                context.pushNamed(AppRoutes.signup);
              },
            ),
            verticalSpace(28),
            CustomDividerWidget(),
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
    );
  }
}
