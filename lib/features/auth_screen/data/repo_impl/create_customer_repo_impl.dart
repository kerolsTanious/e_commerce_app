import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_contract/create_customer_datasource_contract.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/create_customer_stripe/CreateCustomerResponseModel.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/repo/create_customer_repo.dart';

class CreateCustomerRepoImpl extends CreateCustomerRepo {
  final CreateCustomerDatasourceContract createCustomerDatasourceContract;

  CreateCustomerRepoImpl({required this.createCustomerDatasourceContract});

  @override
  Future<Either<CreateCustomerResponseModel, String>> createCustomer() async {
    var result = await createCustomerDatasourceContract.createCustomer();
    return result.fold(
      (response) {
        return Left(response);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
