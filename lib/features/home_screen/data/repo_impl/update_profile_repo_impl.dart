import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/update_profile_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/update_profile_entity/UpadateProfileResponseEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/update_profile_repo.dart';

class UpdateProfileRepoImpl extends UpdateProfileRepo {
  final UpdateProfileDatasourceContract updateProfileDatasourceContract;

  UpdateProfileRepoImpl({required this.updateProfileDatasourceContract});

  @override
  Future<Either<UpdateProfileResponseEntity, String>> updateProfile({
    required String token,
    required String name,
    required String mobileNumber,
    required String email,
  }) async {
    var result = await updateProfileDatasourceContract.updateProfile(
      token: token,
      name: name,
      mobileNumber: mobileNumber,
      email: email,
    );
    return result.fold(
      (response) {
        UpdateProfileResponseEntity updateProfileResponseEntity =
            response.toUpdateProfileResponseEntity();
        return Left(updateProfileResponseEntity);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
