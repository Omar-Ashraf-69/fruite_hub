import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/features/onboarding/data/models/onboarding_page_data_model.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/on_boarding_titles.dart';
import 'package:fruit_hub/generated/l10n.dart';

// Change this from a global variable to a global function
List<OnBoardingPageModel> getOnBoardingPages(BuildContext context) {
  return [
    OnBoardingPageModel(
      backgroundImage: Assets.svgsPageViewItem1BackgroundImage,
      image: Assets.svgsPageViewItem1Image,
      title: const OnBoardingPage1TitleTextWidget(),
      showSkip: true,
      description: S.of(context).on_boarding_title_1, // Context is now completely valid!
    ),
    OnBoardingPageModel(
      backgroundImage: Assets.svgsPageViewItem2BackgroundImage,
      image: Assets.svgsPageViewItem2Image,
      title: const OnBoardingPage2TitleTextWidget(),
      description: S.of(context).on_boarding_title_2,
    ),
  ];
}