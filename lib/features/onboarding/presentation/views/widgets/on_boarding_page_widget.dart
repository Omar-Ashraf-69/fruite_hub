import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/onboarding/data/models/onboarding_page_data_model.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OnBoardingPageWidget extends StatelessWidget {
  final ValueNotifier<int> currentPage;
  final PageController pageController;
  final OnBoardingPageModel item;

  const OnBoardingPageWidget({
    super.key,
    required this.currentPage,
    required this.pageController,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImageHeader(context),
        verticalSpace(24),
        item.title,
        verticalSpace(24),
        _buildDescription(context),
      ],
    );
  }

  Widget _buildImageHeader(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: context.height * 0.5,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              item.backgroundImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              item.image,
              width: 250.w,
              height: 250.h,
              fit: BoxFit.contain,
            ),
          ),
          if (item.showSkip) _buildSkipButton(context),
        ],
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return Positioned.directional(
      top: 24.h,
      start: 24.w,
      textDirection: Directionality.of(context),
      child: ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, page, _) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: page == 0 ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                S.of(context).skip,
                style: TextStyles.regular13.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      child: Text(
        item.description,
        style: TextStyles.semiBold13,
        textAlign: TextAlign.center,
      ),
    );
  }
}
