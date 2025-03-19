import 'package:e_commerce_app_route/core/resuable_components/failure_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/loading_state_widget.dart';
import 'package:e_commerce_app_route/core/resuable_components/product_list_view_item.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_cubit/product_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBodyProductList extends StatelessWidget {
  const HomeScreenBodyProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return SizedBox(
            height: 260.h,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.productList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ProductListViewItem(
                    productData: state.productList[index],
                    addToCart: () {
                      UpdateCartCubit.updateCartCubit(context).addCartItem(
                        token: PrefsHelper.getToken(),
                        productId: state.productList[index].id ?? '',
                      );
                    },
                  ),
                );
              },
            ),
          );
        } else if (state is ProductFailure) {
          return FailureStateWidget(errorMessage: state.errorMessage);
        } else {
          return const LoadingStateWidget();
        }
      },
    );
  }
}
