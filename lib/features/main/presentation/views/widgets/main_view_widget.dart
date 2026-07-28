
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub/features/products/presentation/views/products_view.dart';
import 'package:fruit_hub/generated/l10n.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this._currentIndex});

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _currentIndex,
      children: [
        HomeView(),
        ProductsView(),
        CartView(),
        Center(child: Text(S.of(context).profile_view)),
      ],
    );
  }
}
