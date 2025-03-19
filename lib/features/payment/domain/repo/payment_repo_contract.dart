import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';

abstract class PaymentRepoContract {
  Future<Either<PaymentIntentModel, String>> makePayment(
      {required CreatePaymentIntentInput input});
}
