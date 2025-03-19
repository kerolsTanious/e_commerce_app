import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/delete_cart_repo.dart';

class DeleteCartItemUseCase {
  final DeleteCartRepo deleteCartRepo;

  DeleteCartItemUseCase({required this.deleteCartRepo});

  Future<Either<CartResponseEntity, String>> call({
    required String token,
    required String productId,
  }) async {
    return await deleteCartRepo.deleteItem(token: token, productId: productId);
  }
}
