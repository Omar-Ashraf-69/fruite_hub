import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/constants/pref_keys.dart';
import 'package:fruit_hub/core/di/dependecny_injection.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DotsAndGetStartedButton extends StatelessWidget {
  final ValueNotifier<int> currentPage;

  const DotsAndGetStartedButton({
    super.key,
    required this.currentPage,
    required this.pages,
  });
  final int pages;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OnBoardingIndicator(currentPage: currentPage, pageCount: pages),
        verticalSpace(24),
        GetStartedButtonWidget(currentPage: currentPage),
      ],
    );
  }
}

class GetStartedButtonWidget extends StatelessWidget {
  final ValueNotifier<int> currentPage;

  const GetStartedButtonWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
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
                    onPressed: () async {
                      await getIt<SharedPreferences>().setBool(
                        PrefKeys.isOnboardingSeen,
                        true,
                      );
                      // ignore: use_build_context_synchronously
                      context.pushNamedAndRemoveAll(AppRoutes.login);
                    },
                    child: Text(
                      S.of(context).start_shopping,
                      style: TextStyles.bold16,
                    ),
                  ),
                )
              : const SizedBox(key: ValueKey('empty')),
        );
      },
    );
  }
}

class OnBoardingIndicator extends StatelessWidget {
  final ValueNotifier<int> currentPage;
  final int pageCount;

  const OnBoardingIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (context, page, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pageCount,
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
    );
  }
}
