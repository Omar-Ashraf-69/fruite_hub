import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/data/models/navbar_data_model.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/bottom_navbar_item.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_nav_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/main_view_body_bloc_listener.dart';
import 'package:fruit_hub/generated/l10n.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: SafeArea(
          child: MainViewBodyBlocListener(currentIndex: _currentIndex),
        ),
        bottomNavigationBar: CustomBottomNavBar(children: buildList()),
      ),
    );
  }

  List<Widget> buildList() {
    return List.generate(
      _navigationItems.length,
      (index) => _buildNavItem(index, _navigationItems[index]),
    );
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
