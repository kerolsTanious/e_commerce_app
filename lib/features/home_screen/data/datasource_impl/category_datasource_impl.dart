import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/category_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/category_model/category_response.dart';

class CategoryDataSourceImpl implements CategoryDataSourceContract {
  final ApiManager apiManager;

  CategoryDataSourceImpl({required this.apiManager});

  @override
  Future<Either<CategoryResponse, String>> getCategories() async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.allCategoryEndPoint,
      );
      CategoryResponse categoryResponse = CategoryResponse.fromJson(response);

      return Left(categoryResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
