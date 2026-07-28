import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Directionality.of(context) == TextDirection.ltr
                  ? Icons.arrow_back_ios_new_outlined
                  : Icons.arrow_forward_ios_outlined,
              size: 24,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(title, style: TextStyles.bold19),
          ),

          const Opacity(opacity: 0, child: Icon(Icons.arrow_back, size: 24)),
        ],
      ),
    );
  }
}
