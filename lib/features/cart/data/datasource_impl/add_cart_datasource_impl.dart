import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/add_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/data/model/add_cart_item/AddCartItemResponseModel.dart';
import 'package:e_commerce_app_route/features/cart/data/model/get_cart_model/GetCartResponseModel.dart';

class AddCartDataSourceImpl extends AddCartDatasourceContract {
  final ApiManager apiManager;

  AddCartDataSourceImpl({required this.apiManager});

  @override
  Future<Either<AddCartItemResponseModel, String>> addProduct(
      {required String token, required String productId}) async {
    try {
      var response = await apiManager.postRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.addProductToCartEndPoint,
        body: {"productId": productId},
        headers: {"token": token},
      );
      AddCartItemResponseModel addCartResponseModel =
      AddCartItemResponseModel.fromJson(response.data);
      if (addCartResponseModel.statusMsg == "fail") {
        return Right(addCartResponseModel.message ?? "");
      }
      return Left(addCartResponseModel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
