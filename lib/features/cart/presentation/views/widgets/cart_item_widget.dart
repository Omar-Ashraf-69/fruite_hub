import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_delete_price_column.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_details_column.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_image.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
  });
  final CartItemEntity product;

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
