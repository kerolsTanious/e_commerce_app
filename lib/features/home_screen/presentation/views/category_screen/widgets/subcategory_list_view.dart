import 'package:e_commerce_app_route/core/resuable_components/failure_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/loading_state_widget.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/sub_category_cubit/sub_category_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/sub_category_cubit/sub_category_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/sub_categories_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryListView extends StatelessWidget {
  const SubCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (context, state) {
        if (state is SubCategorySuccess) {
          return Container(
            width: double.infinity,
            height: 620.h,
            margin: EdgeInsets.only(right: 16.w),
            child: GridView.builder(
              itemCount: state.data.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 1.9.r,
              ),
              itemBuilder: (context, index) {
                return SubCategoriesListViewItem(
                  subCategoryTitle: state.data[index].name ?? '',
                  subCategoryId: state.data[index].id ?? "",
                );
              },
            ),
          );
        } else if (state is SubCategoryFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return const LoadingStateWidget();
        }
      },
    );
  }
}
