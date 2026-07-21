import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(opacity: 0, child: Icon(Icons.arrow_back, size: 24)),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(S.of(context).products, style: TextStyles.bold19),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: AppColors.lightWhite,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(Assets.svgsNotification),
          ),
        ],
      ),
    );
  }
}
