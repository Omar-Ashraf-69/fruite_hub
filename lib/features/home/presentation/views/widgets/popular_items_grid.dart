
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/popular_item.dart';

class PopularItemsGrid extends StatelessWidget {
  const PopularItemsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6, // Increased to see your scrolling in action!
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.2,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => const PopularItemWidget(),
    );
  }
}
