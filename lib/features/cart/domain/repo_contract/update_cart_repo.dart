import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';

abstract class UpdateCartRepo {
  Future<Either<CartResponseEntity, String>> updateCart(
      {required num count, required String productId, required String token});
}
