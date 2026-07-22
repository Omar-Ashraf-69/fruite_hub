import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/item_counter_button.dart';

class CartItemDetailsColumn extends StatelessWidget {
  const CartItemDetailsColumn({super.key, required this.cartItem});

  final CartItemEntity cartItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cartItem.product.name, style: TextStyles.bold16),
        const Spacer(),
        Text(
          cartItem.product.unitAmount.toString(),
          style: TextStyles.semiBold16.copyWith(
            color: AppColors.lightSecondaryColor,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            ItemCounterbutton(
              icon: Icons.add,
              onTap: () {
                cartItem.incrementCounter();
                context.read<CartItemCubit>().updateCartItem(cartItem);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                cartItem.counter.toString(),
                style: TextStyles.bold19,
              ),
            ),
            ItemCounterbutton(
              icon: Icons.remove,
              color: AppColors.ligtherWhite,
              onTap: () {
                cartItem.decrementCounter();
                context.read<CartItemCubit>().updateCartItem(cartItem);
              },
              iconColor: AppColors.darkBlue,
            ),
          ],
        ),
      ],
    );
  }
}
