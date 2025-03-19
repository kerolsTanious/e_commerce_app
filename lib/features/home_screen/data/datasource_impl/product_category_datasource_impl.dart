import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/api/query_parameters.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/product_category_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductResponse.dart';

class ProductCategoryDatasourceImpl extends ProductCategoryDatasourceContract {
  final ApiManager apiManager;

  ProductCategoryDatasourceImpl({required this.apiManager});

  @override
  Future<Either<ProductResponse, String>> getAllProductByCategory(
      {required String categoryId}) async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.getAllProductsByCategory,
        queryParameters:
            QueryParameters.allProductsByCategory(categoryId: categoryId),
      );
      ProductResponse productResponse = ProductResponse.fromJson(response);
      return Left(productResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
