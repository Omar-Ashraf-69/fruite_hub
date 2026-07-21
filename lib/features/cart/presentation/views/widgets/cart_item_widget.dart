import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_delete_price_column.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_details_column.dart';

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
              CartItemImage(image: image),
              horizontalSpace(10),
              Expanded(
                child: CartItemDetailsColumn(name: name, weight: weight, onAdd: onAdd, quantity: quantity, onRemove: onRemove),
              ),
              horizontalSpace(12),
              CartDeletePriceColumn(onDelete: onDelete, price: price),
              horizontalSpace(8),
            ],
          ),
        ),
        Divider(color: AppColors.lightWhite, thickness: 1.5.h),
      ],
    );
  }
}


class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.lightWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}
