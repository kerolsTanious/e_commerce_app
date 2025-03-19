import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/get_cart_repo.dart';

class GetCartUseCase {
  final GetCartRepo getCartRepo;

  GetCartUseCase({required this.getCartRepo});

  Future<Either<CartResponseEntity, String>> call(
      {required String token}) async {
    return await getCartRepo.getCart(token: token);
  }
}
