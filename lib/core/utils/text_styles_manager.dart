import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStylesManager {
  static TextStyle textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorManager.textColor,
  );

  static TextStyle textStyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.textColor,
  );

  static TextStyle textStyle11 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.primaryColor.withOpacity(0.6),
  );
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorManager.textColor,
  );

  static TextStyle textStyle24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: ColorManager.primaryColor,
  );
  static TextStyle textStyle25 = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w500,
    color: ColorManager.textColor,
  );
}
