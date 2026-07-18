import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Svg;
import 'package:fruit_hub/core/constants/assets.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_text_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:intl/intl.dart' as intl;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeViewBody(),
    Center(child: Text(S.current.products_view)),
    Center(child: Text(S.current.cart_view)),
    Center(child: Text(S.current.profile_view)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
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
          children: [
            _buildNavItem(
              0,
              Assets.iconsOutlineHome,
              Assets.iconsBoldHome,
              S.current.home,
            ),
            _buildNavItem(
              1,
              Assets.iconsOutlineProducts,
              Assets.iconsBoldProducts,
              S.current.products,
            ),
            _buildNavItem(
              2,
              Assets.iconsBoldShoppingCart,
              Assets.iconsBoldShoppingCart,
              S.current.cart,
            ),
            _buildNavItem(
              3,
              Assets.iconsOutlineUser,
              Assets.iconsBoldUser,
              S.current.profile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    String outlineIcon,
    String boldIcon,
    String label,
  ) {
    final bool isSelected = _currentIndex == index;

    // 1. Check if the current locale is Right-To-Left (Arabic)
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    // 2. Build the two active widgets
    final Widget textWidget = Text(
      label,
      style: TextStyles.bold13.copyWith(color: AppColors.lightPrimaryColor),
    );

    final Widget iconWidget = Container(
      padding: EdgeInsets.all(8.w),
      decoration: const BoxDecoration(
        color: AppColors.lightPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        boldIcon,
        height: 16.h,
        width: 16.w,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        // Dynamic padding updates correctly depending on who comes first
        padding: isSelected
            ? isRtl
                  ? EdgeInsetsDirectional.only(start: 0, end: 12.w)
                  : EdgeInsetsDirectional.only(start: 0, end: 12.w)
            : EdgeInsets.all(12.w),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.lighterGray,
                borderRadius: BorderRadius.circular(30.r),
              )
            : const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              // 3. Swap layout order depending on text directionality
              // if (isRtl) ...[
              //   iconWidget, // English: Icon on the left
              //   horizontalSpace(8),
              //   textWidget, // Arabic: Icon on the right
              // ] else ...[
              iconWidget, // English: Icon on the left
              horizontalSpace(8),
              textWidget, // English: Text on the right
              //],
            ] else ...[
              SvgPicture.asset(
                outlineIcon,
                height: 22.h,
                width: 22.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.lightGray,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14, top: 14),
      // Removed the nested Scaffold. Instead, we use a clean Column
      // or build the AppBar assets directly inside the scroll layout.
      child: Column(
        children: [
          // 1. App Bar Header (Built using standard widgets since it doesn't need to scroll)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(S.current.welcome, style: TextStyles.semiBold13),
            subtitle: Text("Mora", style: TextStyles.bold16),
            leading: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              height: 40.h,
              width: 40.w,
              child: Image.asset(Assets.imagesProfileImage),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: AppColors.lightGreen,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Assets.svgsNotification),
            ),
          ),
          verticalSpace(14),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: FittedBox(
                        fit: BoxFit.none,
                        child: SvgPicture.asset(
                          Assets.svgsSearchIcon,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      suffixIcon: SvgPicture.asset(
                        Assets.svgsFilter,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.none,
                      ),
                      hintText: S.current.search_for,
                      hintMaxLines: 1,
                      hintStyle: TextStyles.bold13.copyWith(
                        color: AppColors.lightGray,
                      ),
                      contentPadding: const EdgeInsets.all(12),
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(24)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 140.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => horizontalSpace(10),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const BannerWidget();
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(24)),

                // "Popular" Header Section
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(S.current.most_popular, style: TextStyles.bold19),
                        const Spacer(),
                        Text(
                          S.current.see_all,
                          style: TextStyles.semiBold13.copyWith(
                            color: AppColors.lightPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: verticalSpace(12)),

                // Your Grid View (Now works perfectly!)
                SliverGrid.builder(
                  itemCount: 6, // Increased to see your scrolling in action!
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1.2,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => const PopularItemsWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopularItemsWidget extends StatelessWidget {
  const PopularItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightCardBackground,
      ),
      child: Stack(
        children: [
          // 1. Center/Top align the image nicely so it leaves room for the text
          Positioned(
            top: 12.h,
            left: 0,
            right: 0,
            bottom: 60
                .h, // Pushes the bottom boundary up to prevent overlapping text
            child: Image.asset(
              Assets.imagesWatermelonTest,
              fit: BoxFit.contain,
            ),
          ),

          // 2. Favorite button anchored neatly at the top right
          PositionedDirectional(
            top: 4.h,
            end: 4.w,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),

          // 3. The Bottom Info Layout (Pinned directly to the bottom)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              // Lowers default padding footprint so it fits the grid safely
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text Info Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.current.watermelon,
                          style: TextStyles.bold16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpace(2),
                        Row(
                          children: [
                            Text(
                              "20 ${S.current.currency}",
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.lightSecondaryColor,
                              ),
                            ),
                            horizontalSpace(2),
                            Text(
                              "/${S.current.kg}",
                              style: TextStyles.bold13.copyWith(
                                color: AppColors.lightSecondaryColor.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Add Button
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, size: 16.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine TextDirection cleanly and naturally
    final isRtl = intl.Bidi.isRtlLanguage(intl.Intl.getCurrentLocale());
    final currentDirection = isRtl ? TextDirection.rtl : TextDirection.ltr;

    return SizedBox(
      height: 140.h,
      width:
          MediaQuery.of(context).size.width - 28, // Adjusted width for margins
      child: Stack(
        children: [
          PositionedDirectional(
            end: 4,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SvgPicture.asset(
                Assets.svgsPageViewItem2Image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ClipPath(
            clipper: DirectionalCurveClipper(textDirection: currentDirection),
            child: Container(
              height: 140.h,
              width: (MediaQuery.of(context).size.width - 28) * 0.55,
              color: AppColors.green,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 16.0,
                  end: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(12),
                    Text(
                      S.current.feature_item,
                      style: TextStyles.regular13.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Text(
                      "25% ${S.current.offer}",
                      style: TextStyles.bold23.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: Text(
                        S.current.shop_now,
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    verticalSpace(12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DirectionalCurveClipper extends CustomClipper<Path> {
  final TextDirection textDirection;

  DirectionalCurveClipper({required this.textDirection});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final bool isRtl = textDirection == TextDirection.rtl;
    final double radius = 8.0; // Matches your card's outer radius boundary

    if (isRtl) {
      // --- ARABIC (RTL) ---
      // Container sits on the RIGHT. Curve happens on its LEFT edge.
      path.moveTo(size.width, radius);

      // Top right outer corner round
      path.quadraticBezierTo(size.width, 0, size.width - radius, 0);
      path.lineTo(size.width * 0.1, 0);

      // Inner Left Edge Smooth Curve
      path.quadraticBezierTo(
        0,
        size.height * 0.5,
        size.width * 0.1,
        size.height,
      );

      path.lineTo(size.width - radius, size.height);
      // Bottom right outer corner round
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width,
        size.height - radius,
      );
    } else {
      // --- ENGLISH (LTR) ---
      // Container sits on the LEFT. Curve happens on its RIGHT edge.
      path.moveTo(radius, 0);

      // Top left outer corner round
      path.quadraticBezierTo(0, 0, 0, radius);
      path.lineTo(0, size.height - radius);

      // Bottom left outer corner round
      path.quadraticBezierTo(0, size.height, radius, size.height);
      path.lineTo(size.width * 0.9, size.height);

      // Inner Right Edge Smooth Curve
      path.quadraticBezierTo(
        size.width,
        size.height * 0.5,
        size.width * 0.9,
        0,
      );
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant DirectionalCurveClipper oldClipper) {
    return oldClipper.textDirection != textDirection;
  }
}
