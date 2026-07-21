import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:fruit_hub/features/products/presentation/views/widgets/products_app_bar.dart';
import 'package:fruit_hub/features/products/presentation/views/widgets/products_results_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
      child: Column(
        children: [
          ProductsAppBar(),
          verticalSpace(14),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SearchTextField()),
                SliverToBoxAdapter(child: verticalSpace(24)),
                const ProductsResultsHeader(),
                SliverToBoxAdapter(child: verticalSpace(24)),
                ProductsGridViewBlocBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
