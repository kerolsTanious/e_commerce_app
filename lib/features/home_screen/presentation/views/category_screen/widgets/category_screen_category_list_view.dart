import 'package:e_commerce_app_route/core/resuable_components/failure_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/loading_state_widget.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/categories_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/categories_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_index_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_index_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_title_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/sub_category_cubit/sub_category_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/category_screen_category_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/color_manager.dart';

class CategoryScreenCategoryListView extends StatelessWidget {
  const CategoryScreenCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: BlocProvider(
        create: (context) => ChangeCategoryIndexCubit(),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesSuccess) {
              return BlocBuilder<ChangeCategoryIndexCubit,
                  ChangeCategoryIndexState>(
                buildWhen: (previous, current) =>
                    current is ChangeCategoryIndexSuccess,
                builder: (context, changeState) {
                  return Container(
                    height: 670.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.primaryColor.withOpacity(0.3),
                      ),
                      color: ColorManager.categoryBackgroundColor2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryScreenCategoryListViewItem(
                          category: state.categories[index],
                          isSelected: index ==
                              context
                                  .read<ChangeCategoryIndexCubit>()
                                  .selectIndex,
                          onTapOnCategoryItem: () {
                            context
                                .read<ChangeCategoryIndexCubit>()
                                .changeCategoryIndex(index: index);
                          },
                          onTapOnchangeCategoryTitle: () {
                            context
                                .read<ChangeCategoryTitleCubit>()
                                .changeCategoryTitle(
                                  state.categories[index].name ?? '',
                                );
                          },
                          getSubCategory: () {
                            context
                                .read<SubCategoryCubit>()
                                .fetchAllSubCategory(
                              id: state.categories[index].id ?? '',
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is CategoriesFailure) {
              return FailureStateWidget(errorMessage: state.errorMessage);
            } else {
              return const LoadingStateWidget();
            }
          },
        ),
      ),
    );
  }
}
