import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OnBoardingViewBody()));
  }
}

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
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) => _currentPage.value = value,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: context.height * 0.5,
                    child: Stack(
                      alignment: AlignmentGeometry.center,
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            Assets.svgsPageViewItem1BackgroundImage,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          child: SvgPicture.asset(
                            Assets.svgsPageViewItem1Image,
                            width: 250.w,
                            height: 250.h,
                          ),
                        ),
                        Positioned(
                          top: 24.h,
                          right: 24.w,
                          child: ValueListenableBuilder<int>(
                            valueListenable: _currentPage,
                            builder: (context, page, _) {
                              return AnimatedOpacity(
                                duration: const Duration(milliseconds: 250),
                                opacity: page == 0 ? 1 : 0,
                                child: GestureDetector(
                                  onTap: () {
                                    _pageController.animateToPage(
                                      1,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Text(
                                    "تخط",
                                    style: TextStyles.regular13.copyWith(
                                      color: AppColors.lightGray,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(24),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(
                        context,
                      ).style.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Fruit',
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
                        TextSpan(
                          text: ' مرحبًا بك في',
                          style: TextStyles.bold23,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(24),
                  SizedBox(
                    width: context.width * 0.8,
                    child: Text(
                      "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
                      style: TextStyles.semiBold13,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: context.height * 0.5,
                    child: Stack(
                      alignment: AlignmentGeometry.center,
                      children: [
                        Positioned.fill(
                          child: SvgPicture.asset(
                            Assets.svgsPageViewItem2BackgroundImage,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          child: SvgPicture.asset(
                            Assets.svgsPageViewItem2Image,
                            width: 250.w,
                            height: 250.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(24),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(
                        context,
                      ).style.copyWith(color: Colors.black),
                      children: [
                        TextSpan(text: 'ابحث وتسوق', style: TextStyles.bold23),
                      ],
                    ),
                  ),
                  verticalSpace(24),
                  SizedBox(
                    width: context.width * 0.8,
                    child: Text(
                      "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
                      style: TextStyles.semiBold13,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: _currentPage,
                builder: (context, page, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      2,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index <= page
                              ? AppColors.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  );
                },
              ),
              verticalSpace(24),
              ValueListenableBuilder<int>(
                valueListenable: _currentPage,
                builder: (context, page, _) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: page == 1
                        ? SizedBox(
                            key: const ValueKey('button'),
                            width: context.width * 0.9,
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                              ),
                              onPressed: () {
                                context.pushReplacementNamed(AppRoutes.login);
                              },
                              child: Text(
                                "ابدأ التسوق",
                                style: TextStyles.bold16,
                              ),
                            ),
                          )
                        : const SizedBox(key: ValueKey('empty')),
                  );
                },
              ),
            ],
          ),
        ),
        verticalSpace(24),
      ],
    );
  }
}
