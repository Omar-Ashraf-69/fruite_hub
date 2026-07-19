import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/home/data/models/navbar_data_model.dart';

class BottomNavBarIconWidget extends StatelessWidget {
  const BottomNavBarIconWidget({
    super.key,
    required this.isSelected,
    required this.item,
  });

  final bool isSelected;
  final NavigationItem item;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      padding: isSelected
          ? EdgeInsetsDirectional.only(end: 12.w)
          : EdgeInsets.all(12.w),
      decoration: isSelected
          ? BoxDecoration(
              color: AppColors.lighterGray,
              borderRadius: BorderRadius.circular(30.r),
            )
          : const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected) ...[
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: AppColors.lightPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                item.filledIcon,
                height: 16.h,
                width: 16.w,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ), // English: Icon on the left
            horizontalSpace(8),
            Text(
              item.label,
              style: TextStyles.bold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ] else ...[
            SvgPicture.asset(
              item.outlineIcon,
              height: 22.h,
              width: 22.w,
              colorFilter: const ColorFilter.mode(
                AppColors.lightGray,
                BlendMode.srcIn,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
