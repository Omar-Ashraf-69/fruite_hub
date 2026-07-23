import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/core/func/custom_toast.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/routing/app_routes.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class PayButton extends StatelessWidget {
  const PayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: 10.h,
          child: CustomButtonWidget(
            title:
                "${S.of(context).pay} ${context.watch<CartCubit>().cart.totalPrice().toString()} ${S.of(context).currency}",
            onPressed: () {
              if (context.read<CartCubit>().cart.items.isNotEmpty) {
                context.pushNamed(AppRoutes.checkout);
              } else {
                ToastNoContext.showShortToast(
                  message: S.of(context).cart_is_empty,
                );
              }
            },
          ),
        );
      },
    );
  }
}
