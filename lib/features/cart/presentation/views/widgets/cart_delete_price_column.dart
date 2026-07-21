import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class CartDeletePriceColumn extends StatelessWidget {
  const CartDeletePriceColumn({
    super.key,
    required this.onDelete,
    required this.price,
  });

  final VoidCallback? onDelete;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onDelete,
          borderRadius: BorderRadius.circular(24.r),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: SvgPicture.asset(Assets.svgsTrash),
          ),
        ),
    
        const Spacer(),
    
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: TextStyles.bold13.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
