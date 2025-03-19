import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view/widgets/cart_screen_list_view.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view/widgets/total_price_cart_item.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartScreenBody extends StatelessWidget {
  CartScreenBody({
    super.key,
    required this.cartResponseEntity,
  });

  CartResponseEntity cartResponseEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCartCubit, UpdateCartState>(
      builder: (context, state) {
        if (state is UpdateCartSuccess) {
          cartResponseEntity = state.cartResponseEntity;
          return Column(
            children: [
              Expanded(
                child: CartScreenListView(
                  cartResponseEntity: cartResponseEntity,
                ),
              ),
              TotalPriceCartItem(
                totalProductPrice: cartResponseEntity.data?.totalCartPrice ?? 0,
              ),
            ],
          );
        }
        if (state is UpdateCartLoading) {
          return Column(
            children: [
              Expanded(
                child: CartScreenListView(
                  cartResponseEntity: cartResponseEntity,
                ),
              ),
              TotalPriceCartItem(
                totalProductPrice: cartResponseEntity.data?.totalCartPrice ?? 0,
              ),
            ],
          );
        }
        if (state is DeleteCartItemSuccess) {
          cartResponseEntity = state.cartResponseEntity;
          return Column(
            children: [
              Expanded(
                child: CartScreenListView(
                  cartResponseEntity: cartResponseEntity,
                ),
              ),
              TotalPriceCartItem(
                totalProductPrice: cartResponseEntity.data?.totalCartPrice ?? 0,
              ),
            ],
          );
        }
        if (state is DeleteCartItemLoading) {
          return Column(
            children: [
              Expanded(
                child: CartScreenListView(
                  cartResponseEntity: cartResponseEntity,
                ),
              ),
              TotalPriceCartItem(
                totalProductPrice: cartResponseEntity.data?.totalCartPrice ?? 0,
              ),
            ],
          );
        }
        return Column(
          children: [
            Expanded(
              child: CartScreenListView(
                cartResponseEntity: cartResponseEntity,
              ),
            ),
            TotalPriceCartItem(
              totalProductPrice: cartResponseEntity.data?.totalCartPrice ?? 0,
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is UpdateCartFailure) {
          Fluttertoast.showToast(
            msg: "Can't update items count try again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        if (state is DeleteCartItemFailure) {
          Fluttertoast.showToast(
            msg: "Can't Delete Cart Item Please Try Again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}
