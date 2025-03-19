import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/strings_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class CartScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CartScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        StringManager.cart,
        style: TextStylesManager.textStyle20.copyWith(
          color: ColorManager.textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          color: ColorManager.primaryColor,
          Icons.arrow_back,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
