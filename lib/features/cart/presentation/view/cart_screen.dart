import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view/widgets/car_screen_app_bar.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view/widgets/cart_screen_body.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.cartResponseEntity});

  final CartResponseEntity cartResponseEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CartScreenAppBar(),
      body: CartScreenBody(
        cartResponseEntity: cartResponseEntity,
      ),
    );
  }
}
