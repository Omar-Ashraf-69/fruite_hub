import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_item_counter_header.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/cart_items_list_view.dart';
import 'package:fruit_hub/features/cart/presentation/views/widgets/pay_button.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Column(
            children: [
              CartItemCounterHeader(),
              Expanded(
                child: CartItemsListView(cart: context.watch<CartCubit>().cart),
              ),
            ],
          ),
          PayButton(onPressed: () {}),
        ],
      ),
    );
  }
}
