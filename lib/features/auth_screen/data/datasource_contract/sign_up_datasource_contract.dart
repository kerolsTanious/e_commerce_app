import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/auth_model/AuthResponse.dart';

abstract class SignUpDatasourceContract {
  Future<Either<AuthResponse, String>> signUp({
    required String name,
    required String email,
    required String password,
    required String resetPassword,
    required String mobileNumber,
  });
}
