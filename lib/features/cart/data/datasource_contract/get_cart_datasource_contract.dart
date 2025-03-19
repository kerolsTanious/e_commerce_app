import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/model/get_cart_model/GetCartResponseModel.dart';

abstract class GetCartDataSourceContract {
  Future<Either<GetCartResponseModel, String>> getCart({required String token});
}
