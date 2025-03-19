import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/models/create_customer_stripe/CreateCustomerResponseModel.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/repo/create_customer_repo.dart';

class CreateCustomerUseCase {
  final CreateCustomerRepo createCustomerRepo;

  CreateCustomerUseCase({required this.createCustomerRepo});

  Future<Either<CreateCustomerResponseModel, String>> call() async {
    return await createCustomerRepo.createCustomer();
  }
}
