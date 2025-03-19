import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_contract/sign_up_datasource_contract.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/entities/auth_entity/AuthResponseEntity.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/repo/sign_up_repo.dart';

class SignUpRepoImpl extends SignUpRepo {
  final SignUpDatasourceContract signUpDatasourceContract;

  SignUpRepoImpl({required this.signUpDatasourceContract});

  @override
  Future<Either<AuthResponseEntity, String>> signUp({
    required String name,
    required String email,
    required String password,
    required String resetPassword,
    required String mobileNumber,
  }) async {
    var result = await signUpDatasourceContract.signUp(
      name: name,
      email: email,
      password: password,
      resetPassword: resetPassword,
      mobileNumber: mobileNumber,
    );
    return result.fold(
      (response) {
        AuthResponseEntity signUpResponseEntity =
            response.toAuthResponseEntity();
        return Left(signUpResponseEntity);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
