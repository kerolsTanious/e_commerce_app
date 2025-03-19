import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/update_profile_entity/UpadateProfileResponseEntity.dart';

abstract class UpdateProfileRepo {
  Future<Either<UpdateProfileResponseEntity, String>> updateProfile({
    required String token,
    required String name,
    required String mobileNumber,
    required String email,
  });
}
