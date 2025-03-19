import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileTextFormFiled extends StatelessWidget {
  const CustomProfileTextFormFiled({
    super.key,
    required this.controller,
    required this.filedTitle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.maxLength,
    this.readOnly = false,
    required this.keyboardType,
    required this.validator,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final String filedTitle;
  final bool obscureText;
  final TextInputAction textInputAction;
  final int? maxLength;
  final bool readOnly;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          filedTitle,
          style: TextStylesManager.textStyle18,
        ),
        SizedBox(height: 20.h),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          maxLength: maxLength,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.done,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: const Icon(
              Icons.edit_outlined,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.5.r),
              borderSide: BorderSide(
                width: 5.w,
                color: ColorManager.primaryColor.withOpacity(0.3),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.5.r),
              borderSide: BorderSide(
                width: 4.w,
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
