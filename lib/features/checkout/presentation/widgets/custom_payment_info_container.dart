import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';

class CustomPaymentInfoContainer extends StatelessWidget {
  const CustomPaymentInfoContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.lighterGray, width: 1),
      ),
      child: child,
    );
  }
}
