import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/AddProductItemResponseEntity.dart';

abstract class AddCartRepo {
  Future<Either<AddProductItemResponseEntity, String>> addProduct(
      {required String token, required String productId});
}
