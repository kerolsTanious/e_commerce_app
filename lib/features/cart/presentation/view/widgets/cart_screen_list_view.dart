import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view/widgets/cart_screen_list_view_item.dart';
import 'package:flutter/material.dart';

class CartScreenListView extends StatelessWidget {
  const CartScreenListView({
    super.key,
    required this.cartResponseEntity,
  });

  final CartResponseEntity cartResponseEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartResponseEntity.data?.products?.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CartScreenListViewItem(
          cartResponseEntity: cartResponseEntity,
          cartProductIndex: index,
        );
      },
    );
  }
}
