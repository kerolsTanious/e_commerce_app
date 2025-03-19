import 'package:e_commerce_app_route/core/resuable_components/back_button.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_screen_body_change/category_screen_body_chane_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/category_screen/widgets/subcategry_lis_view_products.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/custom_home_screen_app_bar.dart';
import 'package:flutter/material.dart';

class SubCategoryScreenBody extends StatelessWidget {
  const SubCategoryScreenBody({super.key, required this.productsTitle});

  final String productsTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeScreenAppBar(),
        BackButtonFromProducts(onTap: () {
          CategoryScreenBodyChangeCubit.getCategoryScreenBodyChangeCubit(
                  context)
              .changeCurrentIndex(0);
        }),
        const Expanded(
          child: SubCategoryListViewProducts(),
        ),
      ],
    );
  }
}
