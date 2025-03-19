import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/model/get_cart_model/GetCartResponseModel.dart';

abstract class DeleteDataSourceContract {
  Future<Either<GetCartResponseModel, String>> deleteItem({
    required String token,
    required String productId,
  });
}
