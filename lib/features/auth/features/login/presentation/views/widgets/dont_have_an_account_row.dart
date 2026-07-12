import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class CheckingHaveAccountRowTextWidget extends StatelessWidget {
  const CheckingHaveAccountRowTextWidget({
    super.key,
    required this.title,
    required this.subTilte,
    this.onTap,
  });
  final String title;
  final String subTilte;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyles.semiBold13),
        horizontalSpace(5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subTilte,
            style: TextStyles.semiBold13.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
