import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_app_bar.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
      child: Column(children: [CartAppBar(), CartItemsList()]),
    );
  }
}
