import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_contract/login_datasource_contract.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/entities/auth_entity/AuthResponseEntity.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginDataSourceContract loginDataSourceContract;

  LoginRepoImpl({required this.loginDataSourceContract});

  @override
  Future<Either<AuthResponseEntity, String>> login({
    required String email,
    required String password,
  }) async {
    var result = await loginDataSourceContract.login(
      email: email,
      password: password,
    );
    return result.fold(
      (response) {
        AuthResponseEntity authResponseEntity = response.toAuthResponseEntity();
        return Left(authResponseEntity);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
