import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/api_keys.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_contract/create_customer_datasource_contract.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/create_customer_stripe/CreateCustomerResponseModel.dart';

class CreateCustomerDataSourceImpl extends CreateCustomerDatasourceContract {
  final ApiManager apiManager;

  CreateCustomerDataSourceImpl({required this.apiManager});

  @override
  Future<Either<CreateCustomerResponseModel, String>> createCustomer() async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.stripePaymentBaseUrl,
        endPoint: EndPoints.createCustomerForStripe,
        headers: {'Authorization': 'Bearer ${ApiKeys.secretStripeKey}'},
      );
      CreateCustomerResponseModel createCustomerResponseModel =
          CreateCustomerResponseModel.fromJson(response.data);
      return Left(createCustomerResponseModel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
