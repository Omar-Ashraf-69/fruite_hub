import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/custom_payment_info_container.dart';
import 'package:fruit_hub/generated/l10n.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CheckoutCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).order_summary, style: TextStyles.bold19),
          verticalSpace(12),
          CustomPaymentInfoContainer(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).subtotal, style: TextStyles.bold13),
                    Text(
                      "${S.of(context).currency} ${cubit.cart.totalPrice().toString()}",
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lighterGray,
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).shipping, style: TextStyles.bold13),
                    Text(
                      "${S.of(context).currency} 10",
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lighterGray,
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                Divider(color: AppColors.lightWhite, thickness: 1.5),
                verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).total, style: TextStyles.bold19),
                    Text(
                      " ${S.of(context).currency} ${(cubit.totalPrice()).toString()}",
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lighterGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(12),
          Text(S.of(context).shipping_address, style: TextStyles.bold19),
          verticalSpace(12),
          CustomPaymentInfoContainer(
            child: Row(
              children: [
                SvgPicture.asset(Assets.svgsLocation, height: 20.h),
                horizontalSpace(4),
                Text(
                  cubit.checkout.address.toString(),
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(Assets.svgsEdit),
                horizontalSpace(4),
                Text(S.of(context).edit, style: TextStyles.semiBold13),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

