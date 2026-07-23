import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/core/widgets/custom_form_field.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentPageIndex = 0;
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
            children: List.generate(
              3,
              (index) => Expanded(
                child: index <= currentPageIndex
                    ? ActiveCheckoutStep(title: getLabel(index))
                    : InActiveCheckoutStep(
                        index: index + 1,
                        title: getLabel(index),
                      ),
              ),
            ),
          ),
          verticalSpace(12),
          Expanded(
            child: CheckoutPageView(
              pageController: pageController,
              formKey: formKey,
              onPageChanged: (index) =>
                  setState(() => currentPageIndex = index),
            ),
          ),
          CustomButtonWidget(
            title: getTitle(currentPageIndex),
            onPressed: () {
              if (currentPageIndex + 1 == 3) return;
              pageController.animateToPage(
                currentPageIndex + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
          ),
          verticalSpace(32),
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
}

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.onPageChanged,
  });
  final PageController pageController;
  final GlobalKey<FormState> formKey;
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
      const ShippingSection(),
      AddressInputSection(formKey: formKey),
      PaymentSection(),
    ];
  }
}

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    "\$30",
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
                    "\$5",
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
                    "\$35",
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
                "Lagos, Nigeria",
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
  const AddressInputSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomFormField(
              hintText: 'Full Name',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              validator: (value) {},
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Email',
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {},
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Address',
              controller: TextEditingController(),
              keyboardType: TextInputType.streetAddress,
              validator: (value) {},
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'City',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              validator: (value) {},
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Floor number',
              controller: TextEditingController(),
              keyboardType: TextInputType.numberWithOptions(),
              validator: (value) {},
            ),
            verticalSpace(12),
            CustomFormField(
              hintText: 'Phone number',
              keyboardType: TextInputType.phone,
              controller: TextEditingController(),
              validator: (value) {},
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
    return Column(
      children: [
        PaymentSelectionOption(
          title: "Cash on Delivery",
          subtitle: "Pay when you receive your order",
          price: "Free",
          isSelected: true,
        ),
        verticalSpace(12),
        PaymentSelectionOption(
          title: "Credit/Debit Card",
          subtitle: "Pay with your credit/debit card",
          price: "219",
          isSelected: false,
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
  });
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    border: Border.all(color: AppColors.lighterGray, width: 2),
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
