import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/di/dependecny_injection.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub/features/cart/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/home/data/models/navbar_data_model.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/bottom_navbar_item.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruit_hub/features/products/presentation/views/products_view.dart';
import 'package:fruit_hub/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            BlocProvider(
              create: (context) =>
                  ProductsCubit(getIt<ProductsRepo>())
                    ..getBestSellingProducts(),
              child: HomeViewBody(onSeeAllPressed: () => _changeTab(1)),
            ),
            BlocProvider(
              create: (context) =>
                  ProductsCubit(getIt<ProductsRepo>())..getProducts(),
              child: const ProductsView(),
            ),
            CartView(),
            Center(child: Text(S.of(context).profile_view)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _navigationItems.length,
            (index) => _buildNavItem(index, _navigationItems[index]),
          ),
        ),
      ),
    );
  }

  void _changeTab(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildNavItem(int index, NavigationItem item) {
    final bool isSelected = _currentIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30.r),
        onTap: () {
          if (_currentIndex == index) return;
          setState(() {
            _currentIndex = index;
          });
        },
        child: BottomNavBarIconWidget(isSelected: isSelected, item: item),
      ),
    );
  }

  List<NavigationItem> get _navigationItems => [
    NavigationItem(
      label: S.of(context).home,
      outlineIcon: Assets.iconsOutlineHome,
      filledIcon: Assets.iconsBoldHome,
    ),
    NavigationItem(
      label: S.of(context).products,
      outlineIcon: Assets.iconsOutlineProducts,
      filledIcon: Assets.iconsBoldProducts,
    ),
    NavigationItem(
      label: S.of(context).cart,
      outlineIcon: Assets.iconsOutlineShoppingCart,
      filledIcon: Assets.iconsBoldShoppingCart,
    ),
    NavigationItem(
      label: S.of(context).profile,
      outlineIcon: Assets.iconsOutlineUser,
      filledIcon: Assets.iconsBoldUser,
    ),
  ];
}
