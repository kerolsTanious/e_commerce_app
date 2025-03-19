import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/AddProductItemResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/add_cart_repo.dart';

class AddCartUseCase {
  final AddCartRepo addCartRepo;

  AddCartUseCase({required this.addCartRepo});

  Future<Either<AddProductItemResponseEntity, String>> call(
      {required String token, required String productId}) async {
    return await addCartRepo.addProduct(token: token, productId: productId);
  }
}
