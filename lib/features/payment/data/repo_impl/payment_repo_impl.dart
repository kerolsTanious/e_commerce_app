import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/payment/data/datasource_contract/payment_datasource_contract.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:e_commerce_app_route/features/payment/domain/repo/payment_repo_contract.dart';

class PaymentRepoImpl extends PaymentRepoContract {
  final PaymentDataSourceContract paymentDataSourceContract;

  PaymentRepoImpl({required this.paymentDataSourceContract});

  @override
  Future<Either<PaymentIntentModel, String>> makePayment(
      {required CreatePaymentIntentInput input}) async {
    var result = await paymentDataSourceContract.makePayment(input: input);
    return result.fold(
      (response) {
        return Left(response);
      },
      (error) {
        return Right(error.error?.message ?? "");
      },
    );
  }
}
