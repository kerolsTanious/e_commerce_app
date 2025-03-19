import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view/widgets/my_seperator.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view/widgets/successful_payment_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessfulPaymentScreenBody extends StatelessWidget {
  const SuccessfulPaymentScreenBody({
    super.key,
    required this.paymentIntentModel,
  });

  final PaymentIntentModel paymentIntentModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 20.r, left: 20.r, bottom: 60.r, top: 20.r),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SuccessfulPaymentContainer(
              paymentIntentModel: paymentIntentModel,
            ),
            Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.25,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.25,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: MediaQuery.sizeOf(context).height * 0.25 + 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.r),
                width: double.infinity,
                child: const MySeparator(
                  color: Colors.grey,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xff34A853),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 60,
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
