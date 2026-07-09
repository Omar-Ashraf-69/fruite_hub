import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OnBoardingPage1TitleTextWidget extends StatelessWidget {
  const OnBoardingPage1TitleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Detect if the current locale is Right-to-Left (like Arabic)
    final isRTL = Directionality.of(context) == TextDirection.ltr;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.black),
        // 2. Change the order of the spans dynamically based on the language direction
        children: isRTL
            ? [
                // English Order: "مرحبًا بك في" -> "Fruit" -> "HUB"
                TextSpan(
                  text: S.of(context).welcome_to,
                  style: TextStyles.bold23,
                ),
                TextSpan(
                  text: ' Fruit',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'HUB',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.lightSecondaryColor,
                  ),
                ),
              ]
            : [
                // Arabic Order: "Fruit" -> "HUB" -> " welcome to"
                TextSpan(
                  text: S.of(context).welcome_to,
                  style: TextStyles.bold23,
                ),
                TextSpan(
                  text: 'Fruit',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'HUB ',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.lightSecondaryColor,
                  ),
                ),
              ],
      ),
    );
  }
}

class OnBoardingPage2TitleTextWidget extends StatelessWidget {
  const OnBoardingPage2TitleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.black),
        children: [
          TextSpan(
            text: S.of(context).search_and_shop,
            style: TextStyles.bold23,
          ),
        ],
      ),
    );
  }
}
