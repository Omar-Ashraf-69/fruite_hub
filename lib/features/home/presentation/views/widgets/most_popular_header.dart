import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class MostPopularHeader extends StatelessWidget {
  const MostPopularHeader({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap:onTap,
        child: Row(
          children: [
            Text(S.of(context).most_popular, style: TextStyles.bold19),
            const Spacer(),
            Text(
              S.of(context).see_all,
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
