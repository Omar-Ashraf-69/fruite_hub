import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/data/address_controllers.dart';
import 'package:fruit_hub/features/checkout/data/checkout_data.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.cart});
  final CartEntity cart;
  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  int currentPageIndex = 0;
  int maxReachedStep = 0;
  PaymentMethod? selectedPaymentMethod;
  final addressControllers = AddressControllers();
  final CheckoutData checkoutData = CheckoutData();
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
          CustomAppBar(title: "Checkout", onTap: () => context.pop()),
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
              checkoutData: checkoutData,
              addressControllers: addressControllers,
              pageController: pageController,
              addressFormKey: addressFormKey,
              cart: widget.cart,
              selectedPaymentMethod: selectedPaymentMethod,
              onPageChanged: (index) =>
                  setState(() => currentPageIndex = index),
              onPaymentMethodSelected: (PaymentMethod value) {
                setState(() => selectedPaymentMethod = value);
              },
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
        return "Next";
      case 1:
        return "Next";
      case 2:
        return "Pay with PayPal";
      default:
        return "Shipping";
    }
  }

  String getLabel(int index) {
    switch (index) {
      case 0:
        return "Shipping";
      case 1:
        return "Address";
      case 2:
        return "Payment";
      default:
        return "Shipping";
    }
  }

  void onContinuePressed() {
    switch (currentPageIndex) {
      case 0:
        if (selectedPaymentMethod == null) {
          final messenger = ScaffoldMessenger.of(context);

          messenger.removeCurrentSnackBar();

          messenger.showSnackBar(
            const SnackBar(
              duration: Duration(microseconds: 1500000),
              content: Text("Please select a payment method."),
            ),
          );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     behavior: SnackBarBehavior.floating,
          //     margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
          //     content: const Text("Please select a payment method."),
          //   ),
          // );
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //     const SnackBar(content: Text("Please select a payment method.")),
          //   );
          return;
        }

        _goToNextPage();
        break;

      case 1:
        if (!(addressFormKey.currentState?.validate() ?? false)) {
          return;
        }

        checkoutData.fullName = addressControllers.fullName.text;
        checkoutData.email = addressControllers.email.text;
        checkoutData.address = addressControllers.address.text;
        checkoutData.city = addressControllers.city.text;
        checkoutData.floor = addressControllers.floor.text;
        checkoutData.phone = addressControllers.phone.text;
        addressFormKey.currentState?.save();
        FocusScope.of(context).unfocus();
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
    if (selectedPaymentMethod == PaymentMethod.paypal) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: "",
            secretKey: "",
            transactions: const [
              {
                "amount": {
                  "total": '70',
                  "currency": "USD",
                  "details": {
                    "subtotal": '70',
                    "shipping": '0',
                    "shipping_discount": 0,
                  },
                },
                "description": "The payment transaction description.",

                "item_list": {
                  "items": [
                    {
                      "name": "Apple",
                      "quantity": 4,
                      "price": '5',
                      "currency": "USD",
                    },
                    {
                      "name": "Pineapple",
                      "quantity": 5,
                      "price": '10',
                      "currency": "USD",
                    },
                  ],
                },
              },
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              if (kDebugMode) {
                log("onSuccess: $params");
              }
            },
            onError: (error) {
              if (kDebugMode) {
                log("onError: $error");
              }
              Navigator.pop(context);
            },
            onCancel: () {
              if (kDebugMode) {
                log('cancelled:');
              }
            },
          ),
        ),
      );
    } else {
      ToastNoContext.showShortToast(message: "Checkout completed.");
      Navigator.pop(context);
    }
  }
}

enum CheckoutStepState { completed, current, upcoming }

enum PaymentMethod { cashOnDelivery, paypal }

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
    required this.addressFormKey,
    this.selectedPaymentMethod,
    required this.onPaymentMethodSelected,
    required this.onPageChanged,
    required this.addressControllers,
    required this.checkoutData,
    required this.cart,
  });
  final PageController pageController;
  final GlobalKey<FormState> addressFormKey;
  final AddressControllers addressControllers;
  final PaymentMethod? selectedPaymentMethod;
  final ValueChanged<PaymentMethod> onPaymentMethodSelected;
  final CheckoutData checkoutData;
  final CartEntity cart;
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
    return [
      ShippingSection(
        selectedPaymentMethod: selectedPaymentMethod,
        onPaymentMethodSelected: onPaymentMethodSelected,
        checkoutData: checkoutData,
      ),
      AddressInputSection(
        formKey: addressFormKey,
        addressControllers: addressControllers,
      ),
      PaymentSection(checkoutData: checkoutData, cart: cart),
    ];
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
  const PaymentSection({
    super.key,
    required this.checkoutData,
    required this.cart,
  });
  final CheckoutData checkoutData;
  final CartEntity cart;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Summary: ", style: TextStyles.bold19),
          verticalSpace(12),
          CustomPaymentInfoContainer(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal: ", style: TextStyles.bold13),
                    Text(
                      "\$ ${cart.totalPrice().toString()}",
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
                    Text("Shipping: ", style: TextStyles.bold13),
                    Text(
                      "\$ 10",
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
                    Text("Total: ", style: TextStyles.bold19),
                    Text(
                      "\$ ${"${cart.totalPrice() + 10}"}",
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
          Text("Shipping Address: ", style: TextStyles.bold19),
          verticalSpace(12),
          CustomPaymentInfoContainer(
            child: Row(
              children: [
                SvgPicture.asset(Assets.svgsLocation, height: 20.h),
                horizontalSpace(4),
                Text(
                  "${checkoutData.address}, ${checkoutData.city}",
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
                Spacer(),
                SvgPicture.asset(Assets.svgsEdit),
                horizontalSpace(4),
                Text("Edit", style: TextStyles.semiBold13),
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
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.addressControllers,
  });
  final GlobalKey<FormState> formKey;
  final AddressControllers addressControllers;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomFormField(
              hintText: 'Full Name',
              controller: addressControllers.fullName,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Email',
              controller: addressControllers.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Address',
              controller: addressControllers.address,
              keyboardType: TextInputType.streetAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'City',
              controller: addressControllers.city,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Floor number',
              controller: addressControllers.floor,
              keyboardType: TextInputType.numberWithOptions(),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Phone number',
              keyboardType: TextInputType.phone,
              controller: addressControllers.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
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
  const ShippingSection({
    super.key,
    this.selectedPaymentMethod,
    required this.onPaymentMethodSelected,
    required this.checkoutData,
  });

  final PaymentMethod? selectedPaymentMethod;
  final ValueChanged<PaymentMethod> onPaymentMethodSelected;
  final CheckoutData checkoutData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentSelectionOption(
          title: "Cash on Delivery",
          subtitle: "Pay when you receive your order",
          price: "Free",
          isSelected: selectedPaymentMethod == PaymentMethod.cashOnDelivery,
          onTap: () => onPaymentMethodSelected(
            checkoutData.paymentMethod = PaymentMethod.cashOnDelivery,
          ),
        ),
        verticalSpace(12),
        PaymentSelectionOption(
          title: "Credit/Debit Card",
          subtitle: "Pay with your credit/debit card",
          price: "219",
          isSelected: selectedPaymentMethod == PaymentMethod.paypal,
          onTap: () => onPaymentMethodSelected(
            checkoutData.paymentMethod = PaymentMethod.paypal,
          ),
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
              "\$ $price",
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
