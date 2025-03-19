import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model_error/PaymentIntentErrorModel.dart';

abstract class PaymentDataSourceContract {
  Future<Either<PaymentIntentModel, PaymentIntentErrorModel>> makePayment(
      {required CreatePaymentIntentInput input});
}

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}
