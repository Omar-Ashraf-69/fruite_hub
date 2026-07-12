import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isChecked = !isChecked;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.lightPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: isChecked
                ? AppColors.lightPrimaryColor
                : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: isChecked
            ? Icon(Icons.check_sharp, size: 16.sp, color: Colors.white)
            : null,
      ),
    );
  }
}
