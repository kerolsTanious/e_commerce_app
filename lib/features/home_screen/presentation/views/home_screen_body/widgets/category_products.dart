import 'package:e_commerce_app_route/core/resuable_components/back_button.dart';
import 'package:e_commerce_app_route/core/resuable_components/failure_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/loading_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/product_list_view_item.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/change_home_screen_body/change_home_screen_body_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/products_category/products_category_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/products_category/products_category_state.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen_body/widgets/custom_home_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeScreenAppBar(),
        BackButtonFromProducts(
          onTap: () {
            ChangeHomeScreenBodyCubit.changeHomeScreenBodyCubit(context)
                .changeHomeScreenBody(newIndex: 0);
          },
        ),
        BlocBuilder<ProductsCategoryCubit, ProductsCategoryState>(
          builder: (context, state) {
            if (state is ProductsCategorySuccess) {
              return Expanded(
                child: GridView.builder(
                  itemCount: state.productEntityList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return ProductListViewItem(
                      addToCart: () {
                        UpdateCartCubit.updateCartCubit(context).addCartItem(
                          token: PrefsHelper.getToken(),
                          productId: state.productEntityList[index].id ?? '',
                        );
                      },
                      productData: state.productEntityList[index],
                    );
                  },
                ),
              );
            } else if (state is ProductsCategoryFailure) {
              return FailureStateWidget(errorMessage: state.error);
            } else {
              return const Center(child: LoadingStateWidget());
            }
          },
        ),
      ],
    );
  }
}
