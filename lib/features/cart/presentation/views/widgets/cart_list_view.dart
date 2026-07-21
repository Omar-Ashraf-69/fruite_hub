import 'package:flutter/material.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_counter_header.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_widget.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/pay_button.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CartItemCounterHeader(),
                for (int i = 0; i < 10; i++)
                  CartItemWidget(
                    image: Assets.imagesWatermelonTest,
                    name: "Apple",
                    weight: "1kg",
                    price: 100,
                    quantity: 2,
                  ),
              ],
            ),
          ),
          PayButton(onPressed: () {}),
        ],
      ),
    );
  }
}
