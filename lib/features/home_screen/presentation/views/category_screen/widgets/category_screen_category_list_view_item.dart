import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreenCategoryListViewItem extends StatelessWidget {
  const CategoryScreenCategoryListViewItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTapOnCategoryItem,
    required this.onTapOnchangeCategoryTitle,
    required this.getSubCategory,
  });

  final CategoryEntity category;

  final bool isSelected;

  final Function onTapOnCategoryItem;

  final Function onTapOnchangeCategoryTitle;

  final Function getSubCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapOnCategoryItem();
        onTapOnchangeCategoryTitle();
        getSubCategory();
      },
      child: isSelected
          ? Container(
              width: 140.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    margin: REdgeInsets.all(5),
                    width: 8.w,
                    height: 85.h,
                    decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Center(
                    child: Text(
                      category.name ?? "",
                      style: TextStylesManager.textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: 140.w,
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: isSelected
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )
                    : BorderRadius.circular(0),
                color: ColorManager.categoryBackgroundColor.withOpacity(0.5),
              ),
              child: Center(
                child: Text(
                  category.name ?? "",
                  style: TextStylesManager.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
    );
  }
}
