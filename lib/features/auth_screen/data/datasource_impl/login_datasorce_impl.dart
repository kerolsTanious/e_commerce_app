import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_contract/login_datasource_contract.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/auth_model/AuthResponse.dart';

class LoginDataSourceImpl extends LoginDataSourceContract {
  final ApiManager apiManager;

  LoginDataSourceImpl({required this.apiManager});

  @override
  Future<Either<AuthResponse, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.loginEndPoint,
        body: {
          "email": email,
          "password": password,
        },
      );
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      if (authResponse.statusMsg == "fail") {
        return Right(authResponse.message ?? "");
      }
      return Left(authResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
