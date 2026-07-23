import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const CheckoutViewBody()),
    );
  }
}
