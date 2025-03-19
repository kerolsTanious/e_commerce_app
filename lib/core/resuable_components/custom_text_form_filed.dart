import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.titleText,
    required this.hintText,
    required this.prefixIcon,
    required this.textInputType,
    required this.textInputAction,
    this.obscureText,
    required this.validator,
    required this.controller,
    this.suffixIcon,
  });

  final String titleText;
  final String hintText;
  final Icon prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool? obscureText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final IconButton? suffixIcon;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStylesManager.textStyle18.copyWith(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 24.h),
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStylesManager.textStyle18.copyWith(
              fontWeight: FontWeight.w300,
              color: Colors.grey.shade700,
            ),
            prefixIcon: prefixIcon,
            prefixIconColor: Colors.grey.shade700,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorStyle: TextStylesManager.textStyle18.copyWith(
              color: Colors.red.shade900,
            ),
          ),
          keyboardType: textInputType,
          validator: validator,
          controller: controller,
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }
}
