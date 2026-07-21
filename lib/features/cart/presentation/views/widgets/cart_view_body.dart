import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Directionality.of(context) == TextDirection.ltr
                        ? Icons.arrow_back_ios_new_outlined
                        : Icons.arrow_forward_ios_outlined,
                    size: 24,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(S.of(context).cart, style: TextStyles.bold19),
                ),

                const Opacity(
                  opacity: 0,
                  child: Icon(Icons.arrow_back, size: 24),
                ),
              ],
            ),
          ),

          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.lightGreen,
                        margin: EdgeInsets.symmetric(vertical: 12.h),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Center(
                          child: Text(
                            "${S.of(context).you_have} (0) ${S.of(context).items_in_cart}",
                            style: TextStyles.semiBold16.copyWith(
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      ),
                      CartItemWidget(
                        image: Assets.imagesWatermelonTest,
                        name: "Apple",
                        weight: "1kg",
                        price: 100,
                        quantity: 2,
                      ),
                      for (int i = 0; i < 10; i++)
                        CartItemWidget(
                          image: Assets.imagesWatermelonTest,
                          name: "Apple",
                          weight: "1kg",
                          price: 100,
                          quantity: 2,
                        ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10.h,
                  child: CustomButtonWidget(
                    title: "${S.of(context).pay} 120 ${S.of(context).currency}",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    required this.quantity,
    this.onAdd,
    this.onRemove,
    this.onDelete,
  });

  final String image;
  final String name;
  final String weight;
  final double price;
  final int quantity;

  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 85.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              Container(
                width: 80.w,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.lightWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Image.asset(image, fit: BoxFit.contain),
              ),

              horizontalSpace(10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyles.bold16),

                    const Spacer(),

                    Text(
                      weight,
                      style: TextStyles.semiBold16.copyWith(
                        color: AppColors.lightSecondaryColor,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        ItemCounterbutton(icon: Icons.add, onTap: onAdd),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            quantity.toString(),
                            style: TextStyles.bold19,
                          ),
                        ),

                        ItemCounterbutton(icon: Icons.remove, onTap: onRemove),
                      ],
                    ),
                  ],
                ),
              ),

              horizontalSpace(12),

              // Delete + Price
              Column(
                children: [
                  InkWell(
                    onTap: onDelete,
                    borderRadius: BorderRadius.circular(24.r),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: SvgPicture.asset(Assets.svgsTrash),
                    ),
                  ),

                  const Spacer(),

                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyles.bold13.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              horizontalSpace(8),
            ],
          ),
        ),
        Divider(color: AppColors.lightWhite, thickness: 1.5.h),
      ],
    );
  }
}

class ItemCounterbutton extends StatelessWidget {
  const ItemCounterbutton({super.key, required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightPrimaryColor,
        ),
        child: Icon(icon, size: 16.sp, color: AppColors.lightWhite),
      ),
    );
  }
}
