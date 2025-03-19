import 'package:e_commerce_app_route/features/auth_screen/data/models/create_customer_stripe/CreateCustomerResponseModel.dart';

sealed class CreateCustomerState {}

final class CreateCustomerInitial extends CreateCustomerState {}

final class CreateCustomerFailure extends CreateCustomerState {
  final String errorMessage;

  CreateCustomerFailure({required this.errorMessage});
}

final class CreateCustomerSuccess extends CreateCustomerState {
  final CreateCustomerResponseModel createCustomerResponseModel;

  CreateCustomerSuccess({required this.createCustomerResponseModel});
}
