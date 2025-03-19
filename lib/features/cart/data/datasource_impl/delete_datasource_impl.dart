import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/delete_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/data/model/get_cart_model/GetCartResponseModel.dart';

class DeleteDatasourceImpl extends DeleteDataSourceContract {
  final ApiManager apiManager;

  DeleteDatasourceImpl({required this.apiManager});

  @override
  Future<Either<GetCartResponseModel, String>> deleteItem(
      {required String token, required String productId}) async {
    try {
      var response = await apiManager.deleteRequest(
        baseUrl: Constants.baseUrl,
        endPoint:
            EndPoints.deleteCartSpecificItemEndPoint(productId: productId),
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
