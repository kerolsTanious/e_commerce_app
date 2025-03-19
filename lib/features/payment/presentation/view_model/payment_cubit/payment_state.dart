import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';

abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  final PaymentIntentModel paymentIntentModel;

  PaymentSuccess({required this.paymentIntentModel});
}

final class PaymentLoading extends PaymentState {}

final class PaymentFailure extends PaymentState {
  final String errorMessage;

  PaymentFailure({required this.errorMessage});
}
