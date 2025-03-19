import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/domain/usecase/payment_usecase.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view_model/payment_cubit/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentUseCase}) : super(PaymentInitial());
  final PaymentUseCase paymentUseCase;

  Future<void> makePayment({required CreatePaymentIntentInput input}) async {
    emit(PaymentLoading());
    var result = await paymentUseCase.call(input: input);
    result.fold(
      (success) {
        emit(PaymentSuccess(paymentIntentModel: success));
      },
      (error) {
        emit(PaymentFailure(errorMessage: error));
      },
    );
  }
}
