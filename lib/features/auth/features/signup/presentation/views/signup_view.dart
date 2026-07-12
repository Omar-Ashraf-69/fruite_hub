import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_form_field.dart';
import 'package:fruit_hub/features/auth/features/login/presentation/views/login_view.dart';
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

class TermsAndConditionsTextWidget extends StatelessWidget {
  const TermsAndConditionsTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(onChanged: (value) {}, value: true),
        horizontalSpace(10),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: RichText(
              text: TextSpan(
                text: S.of(context).by_continuing_you_agree_to_our,
                style: TextStyles.semiBold13.copyWith(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: S.of(context).terms_and_conditions,
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.lightWhite),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Directionality.of(context) == TextDirection.ltr
                      ? Icons.arrow_back_ios_new
                      : Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Text(S.of(context).sing_up, style: TextStyles.bold19),
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: value ? AppColors.lightPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: value ? AppColors.lightPrimaryColor : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: value
            ? Icon(Icons.check, size: 14.sp, color: Colors.white)
            : null,
      ),
    );
  }
}
