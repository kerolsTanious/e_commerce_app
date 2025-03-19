import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_contract/sign_up_datasource_contract.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/auth_model/AuthResponse.dart';

class SignUpDatasourceImpl extends SignUpDatasourceContract {
  final ApiManager apiManager;

  SignUpDatasourceImpl({required this.apiManager});

  @override
  Future<Either<AuthResponse, String>> signUp({
    required String name,
    required String email,
    required String password,
    required String resetPassword,
    required String mobileNumber,
  }) async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.signUpEndPoint,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": resetPassword,
          "phone": mobileNumber,
        },
      );
      AuthResponse signUpResponse = AuthResponse.fromJson(response.data);
      if (signUpResponse.statusMsg == "fail") {
        return Right(signUpResponse.message ?? "");
      }
      return Left(signUpResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
