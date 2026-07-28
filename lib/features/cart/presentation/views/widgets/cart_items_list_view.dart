
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_widget.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key, required this.cart});
  final CartEntity cart;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) =>
          CartItemWidget(product: cart.items[index]),
    );
  }
}
