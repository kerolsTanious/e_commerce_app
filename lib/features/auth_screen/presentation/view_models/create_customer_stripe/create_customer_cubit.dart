import 'package:e_commerce_app_route/features/auth_screen/domain/usecase/create_customer_use_case.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/create_customer_stripe/create_customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCustomerCubit extends Cubit<CreateCustomerState> {
  CreateCustomerCubit({required this.createCustomerUseCase})
      : super(CreateCustomerInitial());
  final CreateCustomerUseCase createCustomerUseCase;

  Future<void> createCustomerStripe() async {
    var result = await createCustomerUseCase.call();
    result.fold(
      (response) {
        emit(CreateCustomerSuccess(createCustomerResponseModel: response));
      },
      (error) {
        emit(CreateCustomerFailure(errorMessage: error));
      },
    );
  }
}
