import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/banner_list_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/most_popular_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.onSeeAllPressed});
  final VoidCallback onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
      child: Column(
        children: [
          HomeAppBar(),
          verticalSpace(14),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SearchTextField()),
                SliverToBoxAdapter(child: verticalSpace(24)),
                SliverToBoxAdapter(child: BannerListView()),
                SliverToBoxAdapter(child: verticalSpace(24)),
                MostPopularHeader(onTap: onSeeAllPressed),
                SliverToBoxAdapter(child: verticalSpace(12)),
                ProductsGridViewBlocBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
