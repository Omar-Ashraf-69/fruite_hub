import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class ItemCounterbutton extends StatelessWidget {
  const ItemCounterbutton({super.key, required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightPrimaryColor,
        ),
        child: Icon(icon, size: 16.sp, color: AppColors.lightWhite),
      ),
    );
  }
}
