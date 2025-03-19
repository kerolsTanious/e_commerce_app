import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/update_profile_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/update_profile_model/UpdateProfileResponseError.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/update_profile_model/UpdateProfileResponseModel.dart';

class UpdateProfileDataSourceImpl extends UpdateProfileDatasourceContract {
  final ApiManager apiManager;

  UpdateProfileDataSourceImpl({required this.apiManager});

  @override
  Future<Either<UpdateProfileResponseModel, String>> updateProfile({
    required String token,
    required String name,
    required String mobileNumber,
    required String email,
  }) async {
    try {
      var response = await apiManager.updateRequest(
        baseUrl: Constants.baseUrl,
        endpoint: EndPoints.updateProfileData,
        body: {
          "name": name,
          "email": email,
          "phone": mobileNumber,
        },
        headers: {"token": token},
      );
      if (response.statusCode! < 300) {
        UpdateProfileResponseModel updateProfileResponseModel =
            UpdateProfileResponseModel.fromJson(response.data);
        return Left(updateProfileResponseModel);
      } else {
        UpdateProfileResponseErrorModel updateProfileResponseErrorModel =
            UpdateProfileResponseErrorModel.fromJson(response.data);
        return Right(updateProfileResponseErrorModel.errors?.msg ?? "");
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
