import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class BackButtonFromProducts extends StatelessWidget {
  const BackButtonFromProducts({
    super.key, required this.onTap,
  });

  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: ColorManager.primaryColor,
          ),
          TextButton(
            onPressed: () {
              onTap();
            },
            child: Text(
              "Back",
              style: TextStylesManager.textStyle20,
            ),
          ),
        ],
      ),
    );
  }
}
