import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_delete_price_column.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_details_column.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
    this.onAdd,
    this.onRemove,
    this.onDelete,
  });
  final CartItemEntity product;

  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == product) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 85.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //
                  product.product.imageUrl != null
                      ? CartItemImage(image: product.product.imageUrl!)
                      : Container(
                          margin: const EdgeInsets.all(20),
                          color: AppColors.lighterGray,
                          height: 20.h,
                          width: 20.w,
                        ),
                  horizontalSpace(10),
                  Expanded(child: CartItemDetailsColumn(cartItem: product)),
                  horizontalSpace(12),
                  CartDeletePriceColumn(
                    code: product.product.code,
                    price: product.productPrice().toDouble(),
                  ),
                  horizontalSpace(8),
                ],
              ),
            ),
            Divider(color: AppColors.lightWhite, thickness: 1.5.h),
          ],
        );
      },
    );
  }
}

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.image});

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
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: Colors.white,
            size: 50.w,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
