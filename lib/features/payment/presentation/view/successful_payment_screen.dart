import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view/widgets/successful_payment_screen_body.dart';
import 'package:flutter/material.dart';

class SuccessfulPaymentScreen extends StatelessWidget {
  const SuccessfulPaymentScreen({super.key, required this.paymentIntentModel});

  final PaymentIntentModel paymentIntentModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.none,
      ),
      body: SuccessfulPaymentScreenBody(
        paymentIntentModel: paymentIntentModel,
      ),
    );
  }
}
