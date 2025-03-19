import 'package:e_commerce_app_route/core/resuable_components/loading_state_widget.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/strings_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view/successful_payment_screen.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view_model/payment_cubit/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceCartItem extends StatelessWidget {
  const TotalPriceCartItem({
    super.key,
    required this.totalProductPrice,
  });

  final num totalProductPrice;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessfulPaymentScreen(
                paymentIntentModel: state.paymentIntentModel,
              ),
            ),
          );
        }
        if (state is PaymentFailure) {
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
        width: double.infinity,
        height: 100.h,
        margin: const EdgeInsets.only(
          right: 5,
          left: 5,
          bottom: 5,
        ),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: REdgeInsets.only(
                top: 20,
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringManager.totalPrice,
                    style: TextStylesManager.textStyle18.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text(
                        "EGP ",
                        style: TextStylesManager.textStyle18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "$totalProductPrice",
                        style: TextStylesManager.textStyle18.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  CreatePaymentIntentInput input = CreatePaymentIntentInput(
                    amount: totalProductPrice,
                    currency: "egp",
                  );

                  context.read<PaymentCubit>().makePayment(input: input);
                },
                child: Container(
                  height: 55.h,
                  margin: REdgeInsets.only(
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: BlocBuilder<PaymentCubit, PaymentState>(
                    builder: (context, state) {
                      if (state is PaymentLoading) {
                        return const LoadingStateWidget();
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            StringManager.checkOut,
                            style: TextStylesManager.textStyle18,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: ColorManager.textColor,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
