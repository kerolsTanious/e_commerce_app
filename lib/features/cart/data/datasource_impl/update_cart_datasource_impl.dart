import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/update_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/data/model/get_cart_model/GetCartResponseModel.dart';

class UpdateCartDatasourceImpl extends UpdateDataSourceContract {
  final ApiManager apiManager;

  UpdateCartDatasourceImpl({required this.apiManager});

  @override
  Future<Either<GetCartResponseModel, String>> updateCart({
    required num count,
    required String productId,
    required String token,
  }) async {
    try {
      var response = await apiManager.updateRequest(
        baseUrl: Constants.baseUrl,
        endpoint: EndPoints.updateCartItemsEndPoint(productId: productId),
        body: {"count": count.toString()},
        headers: {"token": token},
      );
      GetCartResponseModel getCartResponseModel =
          GetCartResponseModel.fromJson(response.data);
      return Left(getCartResponseModel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
