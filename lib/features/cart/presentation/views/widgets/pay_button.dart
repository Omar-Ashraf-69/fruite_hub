import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/generated/l10n.dart';

class PayButton extends StatelessWidget {
  const PayButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10.h,
      child: CustomButtonWidget(
        title: "${S.of(context).pay} 120 ${S.of(context).currency}",
        onPressed: onPressed,
      ),
    );
  }
}
