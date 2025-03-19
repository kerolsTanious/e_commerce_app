import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/update_cart_repo.dart';

class UpdateCartUseCase {
  final UpdateCartRepo updateCartRepo;

  UpdateCartUseCase({required this.updateCartRepo});

  Future<Either<CartResponseEntity, String>> call({
    required num count,
    required String productId,
    required String token,
  }) async {
    return await updateCartRepo.updateCart(
        count: count, productId: productId, token: token);
  }
}
