
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/banner_widget.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalSpace(10),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const BannerWidget();
        },
      ),
    );
  }
}