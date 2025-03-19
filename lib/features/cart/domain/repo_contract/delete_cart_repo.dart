import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';

abstract class DeleteCartRepo {
  Future<Either<CartResponseEntity, String>> deleteItem({
    required String token,
    required String productId,
  });
}
