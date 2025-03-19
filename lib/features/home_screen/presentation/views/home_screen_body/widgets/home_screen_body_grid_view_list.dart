import 'package:e_commerce_app_route/core/resuable_components/failure_state_widget.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/categories_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/categories_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/home_screen_body_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBodyGridViewList extends StatelessWidget {
  const HomeScreenBodyGridViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            width: double.infinity,
            height: 326.h,
            child: GridView.builder(
              itemCount: state.categories.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 100.h,
                mainAxisSpacing: 16.w,
                crossAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                return HomeScreenBodyGridViewItem(categories: state.categories[index]);
              },
            ),
          );
        } else if (state is CategoriesFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
