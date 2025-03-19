import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_title_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_title_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategoryTitle extends StatelessWidget {
  const CustomCategoryTitle({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeCategoryTitleCubit, ChangeCategoryTitleState>(
      buildWhen: (previous, current) => current is ChangeCategoryTitleSuccess,
      builder: (context, state) {
        return Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              context.read<ChangeCategoryTitleCubit>().categoryTitle,
              style: TextStylesManager.textStyle18.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        );
      },
    );
  }
}
