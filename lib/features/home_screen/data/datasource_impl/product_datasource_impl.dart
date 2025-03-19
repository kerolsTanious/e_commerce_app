import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/api/query_parameters.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/product_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductResponse.dart';

class ProductDataSourceImpl implements ProductDataSourceContract {
  final ApiManager apiManager;

  ProductDataSourceImpl({required this.apiManager});

  @override
  Future<Either<ProductResponse, String>> getAllProduct() async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.allProductsEndPoint,
        queryParameters: QueryParameters.allProductsQueryParameters(
          limitNum: 15,
          sort: "sold",
        ),
      );
      ProductResponse productResponse = ProductResponse.fromJson(response);
      return Left(productResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
