import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/entities/auth_entity/AuthResponseEntity.dart';

abstract class LoginRepo {
  Future<Either<AuthResponseEntity, String>> login({
    required String email,
    required String password,
  });
}
