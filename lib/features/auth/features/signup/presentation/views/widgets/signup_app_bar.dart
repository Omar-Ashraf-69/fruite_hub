import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.lightWhite),
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Directionality.of(context) == TextDirection.ltr
                      ? Icons.arrow_back_ios_new
                      : Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Text(S.of(context).sing_up, style: TextStyles.bold19),
        ],
      ),
    );
  }
}
