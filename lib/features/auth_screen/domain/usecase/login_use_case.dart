import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/entities/auth_entity/AuthResponseEntity.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/repo/login_repo.dart';

class LoginUseCAse {
  final LoginRepo loginRepo;

  LoginUseCAse({required this.loginRepo});

  Future<Either<AuthResponseEntity, String>> call({
    required String email,
    required String password,
  }) async {
    return await loginRepo.login(
      email: email,
      password: password,
    );
  }
}
