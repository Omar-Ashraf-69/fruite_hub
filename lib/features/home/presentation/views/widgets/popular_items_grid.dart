import 'package:flutter/material.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/popular_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length, // Increased to see your scrolling in action!
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.2,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) =>  PopularItemWidget(
        product: products[index],
      ),
    );
  }
}
