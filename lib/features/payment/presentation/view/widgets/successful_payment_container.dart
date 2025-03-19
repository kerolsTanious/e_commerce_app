import 'package:e_commerce_app_route/core/utils/assets_manager.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuccessfulPaymentContainer extends StatelessWidget {
  const SuccessfulPaymentContainer({
    super.key,
    required this.paymentIntentModel,
  });

  final PaymentIntentModel paymentIntentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35.r, right: 35.r, left: 35.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 26.h),
          Text(
            "Thank you!",
            style: TextStylesManager.textStyle25,
          ),
          Text(
            "Your transaction was successful",
            style: TextStylesManager.textStyle20.copyWith(
              color: ColorManager.textColor.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 42.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: TextStylesManager.textStyle18,
              ),
              Text(
                "01/24/2023",
                style: TextStylesManager.textStyle18,
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
                style: TextStylesManager.textStyle18,
              ),
              Text(
                "10:15 AM",
                style: TextStylesManager.textStyle18,
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "To",
                style: TextStylesManager.textStyle18,
              ),
              Text(
                "Kerols Tanious",
                style: TextStylesManager.textStyle18,
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Divider(
            thickness: 1.5,
            color: Colors.grey[500],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStylesManager.textStyle24.copyWith(
                  color: ColorManager.textColor,
                ),
              ),
              Text(
                "${paymentIntentModel.amount! / 100} ${paymentIntentModel.currency!.toUpperCase()}",
                style: TextStylesManager.textStyle24.copyWith(
                  color: ColorManager.textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  width: 35.w,
                  height: 21.h,
                  AssetsManager.masterCardLogo,
                ),
                //SizedBox(width: 25.w),
                Text(
                  "Credit Card Mastercard **78 ",
                  style: TextStylesManager.textStyle18,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.barcode,
                size: 70.sp,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.r, vertical: 15.r),
                  child: Text(
                    "PAID",
                    style: TextStylesManager.textStyle24
                        .copyWith(color: Colors.green),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25 / 2 - 15.h,
          )
        ],
      ),
    );
  }
}
