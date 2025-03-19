import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/entities/auth_entity/AuthResponseEntity.dart';

abstract class SignUpRepo {
  Future<Either<AuthResponseEntity, String>> signUp({
    required String name,
    required String email,
    required String password,
    required String resetPassword,
    required String mobileNumber,
  });
}
