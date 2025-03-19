import 'package:e_commerce_app_route/core/utils/assets_manager.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/category_screen.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/home_screen_body.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/profile_screen/profile_screen.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Widget> screens = [
    HomeScreenBody(),
    CategoryScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      buildWhen: (previous, current) => current is BottomNavigationChangeState,
      builder: (context, state) {
        int index = context.read<BottomNavigationCubit>().currentIndex;
        return Scaffold(
          body: SafeArea(child: screens[index]),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: ColorManager.primaryColor,
                currentIndex: index,
                onTap: (value) {
                  context
                      .read<BottomNavigationCubit>()
                      .changeBottomNavigationState(newIndex: value);
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    label: "",
                    activeIcon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.selectedHome,
                    ),
                    icon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.unSelectedHome,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    activeIcon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.selectedCategory,
                    ),
                    icon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.unSelectedCategory,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    activeIcon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.selectedFavIcon,
                    ),
                    icon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.unSelectedFavIcon,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    activeIcon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.selectedProfile,
                    ),
                    icon: SvgPicture.asset(
                      width: 40.w,
                      height: 40.h,
                      AssetsManager.unSelectedProfile,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
