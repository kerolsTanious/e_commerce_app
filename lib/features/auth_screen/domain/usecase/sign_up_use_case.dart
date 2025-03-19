import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/entities/auth_entity/AuthResponseEntity.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/repo/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;

  SignUpUseCase({required this.signUpRepo});

  Future<Either<AuthResponseEntity, String>> call({
    required String name,
    required String email,
    required String password,
    required String resetPassword,
    required String mobileNumber,
  }) {
    return signUpRepo.signUp(
      name: name,
      email: email,
      password: password,
      resetPassword: resetPassword,
      mobileNumber: mobileNumber,
    );
  }
}
