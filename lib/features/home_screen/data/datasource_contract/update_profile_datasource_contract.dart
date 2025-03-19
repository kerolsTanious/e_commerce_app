import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/update_profile_model/UpdateProfileResponseModel.dart';

abstract class UpdateProfileDatasourceContract {
  Future<Either<UpdateProfileResponseModel, String>>
      updateProfile({
    required String token,
    required String name,
    required String mobileNumber,
    required String email,
  });
}
