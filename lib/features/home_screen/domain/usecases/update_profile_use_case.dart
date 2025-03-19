import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/update_profile_entity/UpadateProfileResponseEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/update_profile_repo.dart';

class UpdateProfileUseCase {
  final UpdateProfileRepo updateProfileRepo;

  UpdateProfileUseCase({required this.updateProfileRepo});

  Future<Either<UpdateProfileResponseEntity, String>> call({
    required String token,
    required String name,
    required String mobileNumber,
    required String email,
  }) async {
    return await updateProfileRepo.updateProfile(
      token: token,
      name: name,
      mobileNumber: mobileNumber,
      email: email,
    );
  }
}
