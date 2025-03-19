import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/model/add_cart_item/AddCartItemResponseModel.dart';

abstract class AddCartDatasourceContract {
  Future<Either<AddCartItemResponseModel, String>> addProduct(
      {required String token, required String productId});
}
