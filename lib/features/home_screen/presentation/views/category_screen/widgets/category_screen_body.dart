import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/category_screen_category_list_view.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/custom_category_title.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/subcategory_list_view.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/custom_home_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreenBody extends StatelessWidget {
  const CategoryScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeScreenAppBar(),
        SizedBox(height: 50.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoryScreenCategoryListView(),
            Expanded(
              child: Column(
                children: [
                  const CustomCategoryTitle(),
                  SizedBox(height: 20.h),
                  const SubCategoryListView(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
