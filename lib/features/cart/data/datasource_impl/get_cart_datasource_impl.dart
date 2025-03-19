import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/get_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/data/model/get_cart_model/GetCartResponseModel.dart';

class GetCartDataSourceImpl extends GetCartDataSourceContract {
  final ApiManager apiManager;

  GetCartDataSourceImpl({required this.apiManager});

  @override
  Future<Either<GetCartResponseModel, String>> getCart(
      {required String token}) async {
    try {
      var response = await apiManager.getRequest(
          baseUrl: Constants.baseUrl,
          endPoint: EndPoints.getProductsCartEndPoint,
          headers: {
            "token": token,
          });
      GetCartResponseModel getCartResponseModel =
          GetCartResponseModel.fromJson(response);
      return Left(getCartResponseModel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
