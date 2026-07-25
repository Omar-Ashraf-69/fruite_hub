import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_step.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/active_inactive_checkout_step.dart';

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

