import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/func/custom_toast.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/core/widgets/custom_form_field.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_step.dart';
import 'package:fruit_hub/features/checkout/domain/entities/payment_method.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});
  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;
  int maxReachedStep = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
      child: Column(
        children: [
          CustomAppBar(
            title: S.of(context).checkout,
            onTap: () => context.pop(),
          ),
          verticalSpace(12),
          Row(
            children: List.generate(3, (index) {
              CheckoutStepState state;

              if (index < currentPageIndex) {
                state = CheckoutStepState.completed;
              } else if (index == currentPageIndex) {
                state = CheckoutStepState.current;
              } else {
                state = CheckoutStepState.upcoming;
              }
              return Expanded(
                child: CheckoutStep(
                  index: index + 1,
                  title: getLabel(index),
                  state: state,
                  onTap: index <= maxReachedStep
                      ? () {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      : null,
                ),
              );
            }),
          ),
          verticalSpace(12),
          Expanded(
            child: CheckoutPageView(
              pageController: pageController,
              onPageChanged: (index) =>
                  setState(() => currentPageIndex = index),
            ),
          ),
          CustomButtonWidget(
            title: getTitle(currentPageIndex),
            onPressed: onContinuePressed,
          ),
          verticalSpace(50),
        ],
      ),
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return S.of(context).next;
      case 1:
        return S.of(context).next;
      case 2:
        return S.of(context).pay_with_paypal;
      default:
        return S.of(context).shipping;
    }
  }

  String getLabel(int index) {
    switch (index) {
      case 0:
        return S.of(context).shipping;
      case 1:
        return S.of(context).address;
      case 2:
        return S.of(context).payment;
      default:
        return S.of(context).shipping;
    }
  }

  void onContinuePressed() {
    switch (currentPageIndex) {
      case 0:
        if (context.read<CheckoutCubit>().checkout.paymentMethod == null) {
          final messenger = ScaffoldMessenger.of(context);

          messenger.removeCurrentSnackBar();

          messenger.showSnackBar(
            SnackBar(
              duration: Duration(microseconds: 1500000),
              content: Text(S.of(context).please_select_a_payment_method),
            ),
          );
          return;
        }

        _goToNextPage();
        break;

      case 1:
        if (!(context
                .read<CheckoutCubit>()
                .addressFormKey
                .currentState
                ?.validate() ??
            false)) {
          context.read<CheckoutCubit>().autovalidateMode =
              AutovalidateMode.onUserInteraction;
          return;
        }
        context.read<CheckoutCubit>().addressFormKey.currentState?.save();
        FocusScope.of(context).unfocus();
        context.read<CheckoutCubit>().saveAddress();
        _goToNextPage();
        break;

      case 2:
        _completeCheckout();
        break;
    }
  }

  bool _isToastVisible = false;
  Future<void> showValidationToast(String message) async {
    if (_isToastVisible) return;

    _isToastVisible = true;

    ToastNoContext.showShortToast(message: message);

    await Future.delayed(const Duration(seconds: 2));

    _isToastVisible = false;
  }

  void _goToNextPage() {
    setState(() {
      if (currentPageIndex + 1 > maxReachedStep) {
        maxReachedStep = currentPageIndex + 1;
      }
    });

    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _completeCheckout() {
    if (context.read<CheckoutCubit>().checkout.paymentMethod ==
        PaymentMethod.paypal) {
      // ToastNoContext.showShortToast(message: "Checkout completed.");
      // Navigator.pop(context);
    } else {
      ToastNoContext.showShortToast(message: S.of(context).checkout_completed);
      Navigator.pop(context);
    }
  }
}

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) => onPageChanged(value),
      itemCount: getPages().length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [ShippingSection(), AddressInputSection(), PaymentSection()];
  }
}

class CheckoutStep extends StatelessWidget {
  const CheckoutStep({
    super.key,
    required this.title,
    required this.index,
    this.onTap,
    required this.state,
  });

  final String title;
  final int index;
  final CheckoutStepState state;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: switch (state) {
        CheckoutStepState.completed => ActiveCheckoutStep(title: title),

        CheckoutStepState.current => ActiveCheckoutStep(title: title),

        CheckoutStepState.upcoming => InActiveCheckoutStep(
          index: index,
          title: title,
        ),
      },
    );
  }
}

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

class CustomPaymentInfoContainer extends StatelessWidget {
  const CustomPaymentInfoContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.lighterGray, width: 1),
      ),
      child: child,
    );
  }
}

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CheckoutCubit>();
    return SingleChildScrollView(
      child: Form(
        key: cubit.addressFormKey,
        autovalidateMode: cubit.autovalidateMode,
        child: Column(
          children: [
            CustomFormField(
              hintText: S.of(context).full_name,
              controller: cubit.addressControllers.fullName,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This ${S.of(context).full_name} is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).email,
              controller: cubit.addressControllers.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This ${S.of(context).email} is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).address,
              controller: cubit.addressControllers.address,
              keyboardType: TextInputType.streetAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This ${S.of(context).address} is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).city,
              controller: cubit.addressControllers.city,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This ${S.of(context).city} is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).floor,
              controller: cubit.addressControllers.floor,
              keyboardType: TextInputType.numberWithOptions(),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This ${S.of(context).floor} is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: S.of(context).phone,
              keyboardType: TextInputType.phone,
              controller: cubit.addressControllers.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This ${S.of(context).phone} is required';
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
            ),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CheckoutCubit>();
    return Column(
      children: [
        PaymentSelectionOption(
          title: S.of(context).cach_on_delivery,
          subtitle: S.of(context).pay_when_you_receive,
          price: S.of(context).free,
          isSelected:
              cubit.checkout.paymentMethod == PaymentMethod.cashOnDelivery,
          onTap: () {
            cubit.selectPaymentMethod(method: PaymentMethod.cashOnDelivery);
            // cubit.checkout.paymentMethod = PaymentMethod.cashOnDelivery;
          },
        ),
        verticalSpace(12),
        PaymentSelectionOption(
          title: S.of(context).credit_debit_card,
          subtitle: S.of(context).pay_with_your_card,
          price:
              "${S.of(context).currency} ${context.read<CheckoutCubit>().cart.totalPrice()}",
          isSelected: cubit.checkout.paymentMethod == PaymentMethod.paypal,
          onTap: () {
            cubit.selectPaymentMethod(method: PaymentMethod.paypal);
          },
        ),
      ],
    );
  }
}

class PaymentSelectionOption extends StatelessWidget {
  const PaymentSelectionOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? AppColors.lightPrimaryColor
                : AppColors.lighterGray,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18.h,
                    width: 18.w,
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColors.lightPrimaryColor
                          : AppColors.lightWhite,
                      border: Border.all(
                        color: AppColors.lighterGray,
                        width: 2,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title, style: TextStyles.semiBold16),
                      verticalSpace(4),
                      Text(
                        subtitle,
                        style: TextStyles.regular13.copyWith(
                          color: AppColors.lighterGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text(
              price,
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InActiveCheckoutStep extends StatelessWidget {
  const InActiveCheckoutStep({
    super.key,
    required this.title,
    required this.index,
  });
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightWhite,
          ),
          child: Center(child: Text("$index", style: TextStyles.semiBold13)),
        ),
        horizontalSpace(4),
        Text(
          title,
          style: TextStyles.semiBold13.copyWith(color: AppColors.lighterGray),
        ),
      ],
    );
  }
}

class ActiveCheckoutStep extends StatelessWidget {
  const ActiveCheckoutStep({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(3.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightPrimaryColor,
          ),
          child: Center(
            child: Icon(Icons.check, size: 16.w, color: Colors.white),
          ),
        ),
        horizontalSpace(4),
        Text(
          title,
          style: TextStyles.semiBold13.copyWith(color: AppColors.lighterGray),
        ),
      ],
    );
  }
}
