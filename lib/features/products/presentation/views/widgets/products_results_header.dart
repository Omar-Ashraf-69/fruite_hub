
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

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
