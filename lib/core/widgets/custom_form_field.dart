import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: customBorder(),
        enabledBorder: customBorder(),
        errorBorder: customBorder(Colors.red),
        focusedErrorBorder: customBorder(Colors.red),
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.lightGray),
        hintText: hintText,
        fillColor: AppColors.moreLightGray,
        filled: true,
      ),
      style: TextStyles.bold13,
    );
  }

  OutlineInputBorder customBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Color(0xffF9FAFA), width: 1.3),
      borderRadius: BorderRadius.circular(16.0),
    );
  }
}
