import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/sub_category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_title_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_screen_body_change/category_screen_body_chane_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_screen_body_change/category_screen_body_chane_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/specific_subcategory_product_cubit/specific_sub_category_product_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/sub_category_cubit/sub_category_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/category_screen_body.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/sub_category_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const List<Widget> categoryScreenBody = [
    CategoryScreenBody(),
    SubCategoryScreenBody(productsTitle: '',),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryScreenBodyChangeCubit, CategoryScreenBodyChangeState>(
      builder: (context, state) {
        if(state is CategoryScreenBodyChange){
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChangeCategoryTitleCubit(),
              ),
              BlocProvider(
                create: (context) =>
                SubCategoryCubit(getIt.get<SubCategoryUseCase>())
                  ..fetchAllSubCategory(id: "6439d61c0049ad0b52b90051"),
              ),
              BlocProvider(
                create: (context) => getIt.get<SpecificSubCategoryProductCubit>()),
            ],
            child: categoryScreenBody[state.newIndex],
          );
        }
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ChangeCategoryTitleCubit(),
            ),
            BlocProvider(
              create: (context) =>
              SubCategoryCubit(getIt.get<SubCategoryUseCase>())
                ..fetchAllSubCategory(id: "6439d61c0049ad0b52b90051"),
            ),
            BlocProvider(
                create: (context) => getIt.get<SpecificSubCategoryProductCubit>()),
          ],
          child: categoryScreenBody[
          CategoryScreenBodyChangeCubit
              .getCategoryScreenBodyChangeCubit(
              context)
              .currentIndex],
        );
      },
    );
  }
}
