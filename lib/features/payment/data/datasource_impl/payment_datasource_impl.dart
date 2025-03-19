import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/stripe/stripe_manager.dart';
import 'package:e_commerce_app_route/features/payment/data/datasource_contract/payment_datasource_contract.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model_error/PaymentIntentErrorModel.dart';

class PaymentDataSourceImpl extends PaymentDataSourceContract {
  final StripeManager stripeManager;

  PaymentDataSourceImpl({required this.stripeManager});

  @override
  Future<Either<PaymentIntentModel, PaymentIntentErrorModel>> makePayment(
      {required CreatePaymentIntentInput input}) async {
    try {
      PaymentIntentModel response = await stripeManager.makePayment(input: input);
      return Left(response);
    } catch (e) {
      PaymentIntentErrorModel paymentIntentErrorModel = PaymentIntentErrorModel.fromJson(e);
      return Right(paymentIntentErrorModel);
    }
  }
}
