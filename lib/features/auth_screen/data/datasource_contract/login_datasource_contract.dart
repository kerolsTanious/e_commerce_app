import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/auth_model/AuthResponse.dart';

abstract class LoginDataSourceContract {
  Future<Either<AuthResponse, String>> login({
    required String email,
    required String password,
  });
}
