import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/create_customer_stripe/CreateCustomerResponseModel.dart';

abstract class CreateCustomerDatasourceContract{
  Future<Either<CreateCustomerResponseModel, String>> createCustomer();
}