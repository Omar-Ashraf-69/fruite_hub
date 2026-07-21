import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PopularItemWidget extends StatelessWidget {
  const PopularItemWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightCardBackground,
      ),
      child: Stack(
        children: [
          // 1. Center/Top align the image nicely so it leaves room for the text
          Positioned(
            top: 12.h,
            left: 0,
            right: 0,
            bottom: 60.h,
            child: product.imageUrl != null
                ? Center(
                    child: SizedBox(
                      width: 120.w,
                      child: CachedNetworkImage(
                        imageUrl: product.imageUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: LoadingAnimationWidget.threeRotatingDots(
                            color: Colors.white,
                            size: 50.w,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  )
                : Container(color: Colors.grey, height: 100, width: 100),
            // child: Image.asset(
            //   Assets.imagesWatermelonTest,
            //   fit: BoxFit.contain,
            // ),
          ),
          // 2. Favorite button anchored neatly at the top right
          PositionedDirectional(
            top: 4.h,
            end: 4.w,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          // 3. The Bottom Info Layout (Pinned directly to the bottom)
          PopularItemDetails(product: product),
        ],
      ),
    );
  }
}

class PopularItemDetails extends StatelessWidget {
  const PopularItemDetails({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        // Lowers default padding footprint so it fits the grid safely
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text Info Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style: TextStyles.bold16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(2),
                  Row(
                    children: [
                      Text(
                        "${product.price} ${S.of(context).currency}",
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                      horizontalSpace(2),
                      Text(
                        "/${S.of(context).kg}",
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.lightSecondaryColor.withValues(
                            alpha: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add Button
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, size: 16.sp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
