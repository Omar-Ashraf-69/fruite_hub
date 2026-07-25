import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/checkout/domain/entities/checkout_step.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/checkout_step.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({
    super.key,
    required this.currentStep,
    required this.maxReachedStep,
    required this.labels,
    required this.onStepTapped,
  });

  final int currentStep;
  final int maxReachedStep;
  final List<String> labels;
  final ValueChanged<int> onStepTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labels.length, (index) {
        return Expanded(
          child: CheckoutStep(
            index: index + 1,
            title: labels[index],
            state: _getStepState(index),
            onTap: index <= maxReachedStep ? () => onStepTapped(index) : null,
          ),
        );
      }),
    );
  }

  CheckoutStepState _getStepState(int index) {
    if (index < currentStep) {
      return CheckoutStepState.completed;
    }

    if (index == currentStep) {
      return CheckoutStepState.current;
    }

    return CheckoutStepState.upcoming;
  }
}
