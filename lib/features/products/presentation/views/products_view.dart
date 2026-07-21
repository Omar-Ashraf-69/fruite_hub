import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductsViewBody();
  }
}

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(opacity: 0, child: Icon(Icons.arrow_back, size: 24)),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(S.of(context).products, style: TextStyles.bold19),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: AppColors.lightWhite,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(Assets.svgsNotification),
                ),
              ],
            ),
          ),
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

class ProductsResultsHeader extends StatelessWidget {
  const ProductsResultsHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Text(
            "${context.watch<ProductsCubit>().productsLength} ${S.of(context).results}",
            style: TextStyles.bold16,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: AppColors.lightWhite, width: 1),
            ),
            child: SvgPicture.asset(Assets.svgsFilter2),
          ),
        ],
      ),
    );
  }
}
