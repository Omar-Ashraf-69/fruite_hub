import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class OnBoardingPage1TitleTextWidget extends StatelessWidget {
  const OnBoardingPage1TitleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.black),
        children: [
          TextSpan(
            text: 'Fruit',
            style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
          ),
          TextSpan(
            text: 'HUB',
            style: TextStyles.bold23.copyWith(color: AppColors.lightSecondaryColor),
          ),
          TextSpan(text: ' مرحبًا بك في', style: TextStyles.bold23),
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
          TextSpan(text: 'ابحث وتسوق', style: TextStyles.bold23),
        ],
      ),
    );
  }
}