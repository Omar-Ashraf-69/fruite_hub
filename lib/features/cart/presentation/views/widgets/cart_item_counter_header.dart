import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CartItemCounterHeader extends StatelessWidget {
  const CartItemCounterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.lightGreen,
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Center(
        child: Text(
          "${S.of(context).you_have} (${context.watch<CartCubit>().cart.items.length}) ${S.of(context).items_in_cart}",
          style: TextStyles.semiBold16.copyWith(color: AppColors.green),
        ),
      ),
    );
  }
}
