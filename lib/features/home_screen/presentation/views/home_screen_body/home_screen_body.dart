import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/change_home_screen_body/change_home_screen_body_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/change_home_screen_body/change_home_screen_body_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/all_home_screen_body.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/brand_products.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  static List<Widget> homeScreenList = [
    const AllHomeScreenBody(),
    const CategoryProducts(),
    const BrandProducts(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeHomeScreenBodyCubit, ChangeHomeScreenBodyState>(
      builder: (context, state) {
        if (state is ChangeHomeScreenBodySuccess) {
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: homeScreenList[
                ChangeHomeScreenBodyCubit.changeHomeScreenBodyCubit(context)
                    .currentIndex],
          );
        }
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 15),
          child: homeScreenList[
              ChangeHomeScreenBodyCubit.changeHomeScreenBodyCubit(context)
                  .currentIndex],
        );
      },
    );
  }
}
