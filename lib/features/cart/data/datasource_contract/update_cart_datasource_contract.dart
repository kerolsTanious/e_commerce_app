import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/model/get_cart_model/GetCartResponseModel.dart';

abstract class UpdateDataSourceContract {
  Future<Either<GetCartResponseModel, String>> updateCart({required num count,required String productId,required String token});
}
