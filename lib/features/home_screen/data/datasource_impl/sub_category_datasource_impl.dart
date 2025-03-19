import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/sub_category_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/sub_category_model/SubCategoryResponse.dart';

class SubCategoryDataSourceImpl implements SubcategoryDatasourceContract {
  final ApiManager apiManager;

  SubCategoryDataSourceImpl({required this.apiManager});

  @override
  Future<Either<SubCategoryResponse, String>> getSubCategory(
      {required String id}) async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.allSubCategoryByIdEndPoint(id: id),
      );
      SubCategoryResponse subCategoryResponse =
          SubCategoryResponse.fromJson(response);
      return Left(subCategoryResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
