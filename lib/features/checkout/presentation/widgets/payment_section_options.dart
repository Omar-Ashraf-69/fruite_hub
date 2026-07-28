import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class PaymentSelectionOption extends StatelessWidget {
  const PaymentSelectionOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? AppColors.lightPrimaryColor
                : AppColors.lighterGray,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18.h,
                    width: 18.w,
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColors.lightPrimaryColor
                          : AppColors.lightWhite,
                      border: Border.all(
                        color: AppColors.lighterGray,
                        width: 2,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title, style: TextStyles.semiBold16),
                      verticalSpace(4),
                      Text(
                        subtitle,
                        style: TextStyles.regular13.copyWith(
                          color: AppColors.lighterGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text(
              price,
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
