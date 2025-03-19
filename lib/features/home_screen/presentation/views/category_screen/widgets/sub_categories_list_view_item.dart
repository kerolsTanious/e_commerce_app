import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_screen_body_change/category_screen_body_chane_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/specific_subcategory_product_cubit/specific_sub_category_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesListViewItem extends StatelessWidget {
  const SubCategoriesListViewItem({
    super.key,
    required this.subCategoryTitle,
    required this.subCategoryId,
  });

  final String subCategoryTitle;
  final String subCategoryId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CategoryScreenBodyChangeCubit.getCategoryScreenBodyChangeCubit(context)
            .changeCurrentIndex(1);
        SpecificSubCategoryProductCubit.getSpecificSubCategoryProductCubit(
                context)
            .fetchSpecificSubCategoryProduct(
          subCategoryId: subCategoryId,
        );
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              textAlign: TextAlign.center,
              subCategoryTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStylesManager.textStyle14.copyWith(
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
