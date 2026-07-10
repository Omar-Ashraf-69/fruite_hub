import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/dots_and_get_started_button.dart';
import 'package:fruit_hub/features/onboarding/presentation/views/widgets/on_boarding_page_view_builder.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = ValueNotifier(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: OnBoardingPageViewBuilderWidget(pageController: _pageController, currentPage: _currentPage),
        ),
        Expanded(
          flex: 1,
          child: DotsAndGetStartedButton(currentPage: _currentPage,pages: 2,),
        ),
        verticalSpace(24),
      ],
    );
  }
}
