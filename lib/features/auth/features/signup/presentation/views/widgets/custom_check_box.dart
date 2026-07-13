import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

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
            color: value
                ? AppColors.lightPrimaryColor
                : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: value
            ? Icon(Icons.check_sharp, size: 16.sp, color: Colors.white)
            : null,
      ),
    );
  }
}
