import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
    this.buttonTitleColor,
    this.backgroundColor = Colors.white,
  });

  final String buttonTitle;
  final void Function() onTap;
  final Color? buttonTitleColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Text(
          buttonTitle,
          style: TextStylesManager.textStyle20.copyWith(
            color: buttonTitleColor,
          ),
        ),
      ),
    );
  }
}
