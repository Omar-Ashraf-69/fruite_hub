
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/auth/features/signup/presentation/views/widgets/custom_check_box.dart';
import 'package:fruit_hub/generated/l10n.dart';

class TermsAndConditionsTextWidget extends StatelessWidget {
    const TermsAndConditionsTextWidget({
    super.key,
    required this.isAccepted,
    required this.onChanged,
  });

  final bool isAccepted;
  final ValueChanged<bool> onChanged;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          value: isAccepted,
          onChanged: onChanged,
        ),
        horizontalSpace(10),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: RichText(
              text: TextSpan(
                text: S.of(context).by_continuing_you_agree_to_our,
                style: TextStyles.semiBold13.copyWith(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: S.of(context).terms_and_conditions,
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
