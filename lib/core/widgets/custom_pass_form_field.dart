
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/func/custom_form_field_border.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CustomPassFormField extends StatelessWidget {
  const CustomPassFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: customBorder(),
        enabledBorder: customBorder(),
        errorBorder: customBorder(Colors.red),
        focusedErrorBorder: customBorder(Colors.red),
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
