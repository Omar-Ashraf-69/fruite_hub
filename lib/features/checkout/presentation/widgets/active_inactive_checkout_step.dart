import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class InActiveCheckoutStep extends StatelessWidget {
  const InActiveCheckoutStep({
    super.key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightWhite,
          ),
          child: Center(child: Text("$index", style: TextStyles.semiBold13)),
        ),
        horizontalSpace(4),
        Text(
          title,
          style: TextStyles.semiBold13.copyWith(color: AppColors.lighterGray),
        ),
      ],
    );
  }
}

class ActiveCheckoutStep extends StatelessWidget {
  const ActiveCheckoutStep({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(3.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightPrimaryColor,
          ),
          child: Center(
            child: Icon(Icons.check, size: 16.w, color: Colors.white),
          ),
        ),
        horizontalSpace(4),
        Text(
          title,
          style: TextStyles.semiBold13.copyWith(color: AppColors.lighterGray),
        ),
      ],
    );
  }
}
