import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/data/const/on_boarding_data.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/on_boarding_page_widget.dart';

class OnBoardingPageViewBuilderWidget extends StatelessWidget {
  const OnBoardingPageViewBuilderWidget({
    super.key,
    required this._pageController,
    required this._currentPage,
  });

  final PageController _pageController;
  final ValueNotifier<int> _currentPage;

  @override
  Widget build(BuildContext context) {
    final onboardingPages = getOnBoardingPages(context);
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (value) => _currentPage.value = value,
      itemCount: onboardingPages.length,
      itemBuilder: (context, index) => OnBoardingPageWidget(
        key: ValueKey(index),
        currentPage: _currentPage,
        pageController: _pageController,
        item: onboardingPages[index],
      ),
    );
  }
}
