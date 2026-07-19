import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/curve_clipper.dart';
import 'package:fruit_hub/generated/l10n.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentDirection = Directionality.of(context);
    return SizedBox(
      height: 140.h,
      width:
          MediaQuery.of(context).size.width - 36, // Adjusted width for margins
      child: Stack(
        children: [
          PositionedDirectional(
            end: 4,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SvgPicture.asset(
                Assets.svgsPageViewItem2Image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ClipPath(
            clipper: DirectionalCurveClipper(textDirection: currentDirection),
            child: Container(
              height: 140.h,
              width: (MediaQuery.of(context).size.width - 36) * 0.55,
              color: AppColors.green,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 16.0,
                  end: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(12),
                    Text(
                      S.of(context).feature_item,
                      style: TextStyles.regular13.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      "25% ${S.of(context).offer}",
                      style: TextStyles.bold23.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: Text(
                        S.of(context).shop_now,
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    verticalSpace(12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
