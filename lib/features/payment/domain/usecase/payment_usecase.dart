import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:e_commerce_app_route/features/payment/domain/repo/payment_repo_contract.dart';

class PaymentUseCase {
  final PaymentRepoContract paymentRepoContract;

  PaymentUseCase({required this.paymentRepoContract});

  Future<Either<PaymentIntentModel, String>> call({required CreatePaymentIntentInput input}) {
    return paymentRepoContract.makePayment(input: input);
  }
}
