import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
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
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(S.of(context).login, style: TextStyles.bold19),
            verticalSpace(24),
            CustomFormField(),
            verticalSpace(24),
            CustomPassFormField(),
            verticalSpace(20),
            ForgetPassWidget(),
            verticalSpace(24),
            CustomButtonWidget(title: S.of(context).login, onPressed: () {}),
            verticalSpace(24),
            HaveAccountRowTextWidget(
              title: S.of(context).dont_have_account,
              subTilte: S.of(context).sing_up,
              onTap: () {},
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

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1.h, color: Colors.grey.shade300),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(S.of(context).or, style: TextStyles.semiBold13),
        ),
        Expanded(
          child: Container(height: 1.h, color: Colors.grey.shade300),
        ),
      ],
    );
  }
}

class ForgetPassWidget extends StatelessWidget {
  const ForgetPassWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerEnd,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          S.of(context).forget_password,
          style: TextStyles.semiBold13.copyWith(
            color: AppColors.lightPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class HaveAccountRowTextWidget extends StatelessWidget {
  const HaveAccountRowTextWidget({
    super.key,
    required this.title,
    required this.subTilte,
    this.onTap,
  });
  final String title;
  final String subTilte;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.semiBold13),
        horizontalSpace(5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTilte,
            style: TextStyles.semiBold13.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class SignButtonWidget extends StatelessWidget {
  const SignButtonWidget({
    super.key,
    required this.icon,
    required this.buttonLabel,
  });
  final String icon;
  final String buttonLabel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 18.h),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: null,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffDDDFDF)),
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(icon),
              Spacer(),
              Text(buttonLabel, style: TextStyles.bold16),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyles.bold16),
      ),
    );
  }
}

class CustomPassFormField extends StatelessWidget {
  const CustomPassFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF9FAFA), width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF9FAFA), width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.lightGray),
        hintText: S.of(context).enter_your_password,
        fillColor: AppColors.moreLightGray,
        filled: true,

        suffixIcon: IconButton(
          onPressed: () {},
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Icon(Icons.remove_red_eye, color: AppColors.lightGray),
          ),
        ),
      ),
      style: TextStyles.bold13,
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF9FAFA), width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF9FAFA), width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.lightGray),
        hintText: S.of(context).enter_your_email_address,
        fillColor: AppColors.moreLightGray,
        filled: true,
      ),
      style: TextStyles.bold13,
    );
  }
}
