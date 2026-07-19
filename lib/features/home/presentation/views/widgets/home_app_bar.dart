import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/local_user_data.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(S.of(context).welcome, style: TextStyles.semiBold13),
      subtitle: Text(
        LocalUserDataSource.getLocalUserData().name,
        style: TextStyles.bold16,
      ),
      leading: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        height: 40.h,
        width: 40.w,
        child: Image.asset(Assets.imagesProfileImage),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: AppColors.lightGreen,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(Assets.svgsNotification),
      ),
    );
  }
}
