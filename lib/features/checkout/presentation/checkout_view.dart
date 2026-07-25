import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cart});
  final CartEntity cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child:  CheckoutViewBody(
      cart: cart,
    )));
  }
}
