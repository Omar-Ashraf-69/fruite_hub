import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: FittedBox(
          fit: BoxFit.none,
          child: SvgPicture.asset(
            Assets.svgsSearchIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),
        suffixIcon: SvgPicture.asset(
          Assets.svgsFilter,
          width: 24.w,
          height: 24.h,
          fit: BoxFit.none,
        ),
        hintText: S.of(context).search_for,
        hintMaxLines: 1,
        hintStyle: TextStyles.bold13.copyWith(
          color: AppColors.lightGray,
        ),
        contentPadding: const EdgeInsets.all(12),
        alignLabelWithHint: true,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
