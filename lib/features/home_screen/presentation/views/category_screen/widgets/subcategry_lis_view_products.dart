import 'package:e_commerce_app_route/core/resuable_components/failure_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/loading_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/product_list_view_item.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/specific_subcategory_product_cubit/specific_sub_category_product_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/specific_subcategory_product_cubit/specific_sub_category_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryListViewProducts extends StatelessWidget {
  const SubCategoryListViewProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificSubCategoryProductCubit,
        SpecificSubCategoryProductState>(
      builder: (context, state) {
        if (state is SpecificSubCategoryProductSuccess) {
          return Padding(
            padding: REdgeInsets.all(15),
            child: GridView.builder(
              itemCount: state.listProductEntity.length,
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
                      productId: state.listProductEntity[index].id ?? '',
                    );
                  },
                  productData: state.listProductEntity[index],
                );
              },
            ),
          );
        } else if (state is SpecificSubCategoryProductIFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return const LoadingStateWidget();
        }
      },
    );
  }
}
