import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/show_snak_bar.dart';
import 'package:fruit_hub/core/helpers/extenstions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button_widget.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/helpers/checkout_completion.dart';
import 'package:fruit_hub/features/checkout/presentation/helpers/checkout_labels.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/address_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/checkout_page_veiw.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/checkout_stepper.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});
  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  final PageController pageController = PageController();
  final addressSectionKey = GlobalKey<AddressInputSectionState>();
  int maxReachedStep = 0;
  int currentPageIndex = 0;

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
          CheckoutStepper(
            currentStep: currentPageIndex,
            maxReachedStep: maxReachedStep,
            onStepTapped: (index) => _onStepTapped(index),
            labels: CheckoutLabels.stepTitles(context),
          ),
          verticalSpace(12),
          Expanded(
            child: CheckoutPageView(
              addressKey: addressSectionKey,
              pageController: pageController,
              onPageChanged: (index) =>
                  setState(() => currentPageIndex = index),
            ),
          ),
          CustomButtonWidget(
            title: CheckoutLabels.buttonTitles(context)[currentPageIndex],
            onPressed: onContinuePressed,
          ),
          verticalSpace(50),
        ],
      ),
    );
  }

  void onContinuePressed() => switch (currentPageIndex) {
    0 => _handleShippingStep(),
    1 => _handleAddressStep(),
    2 => _handlePaymentStep(),
    _ => null,
  };
  void _onStepTapped(int index) {
    if (index <= currentPageIndex) {
      _goToStep(index);
      return;
    }
    onContinuePressed();
  }

  void _goToStep(int index) {
    setState(() => currentPageIndex = index);
    FocusScope.of(context).unfocus();

    FocusManager.instance.primaryFocus?.unfocus();
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _goToNextPage() {
    setState(() {
      maxReachedStep = max(maxReachedStep, currentPageIndex + 1);
    });
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _handlePaymentStep() {
    completeCheckout(context);
  }

  void _handleAddressStep() {
    if (!addressSectionKey.currentState!.validateAndSave()) {
      return;
    }
    FocusScope.of(context).unfocus();
    _goToNextPage();
  }

  void _handleShippingStep() {
    if (!context.read<CheckoutCubit>().canContinueFromPaymentStep()) {
      showSankBar(context);
      return;
    }
    _goToNextPage();
  }
}
