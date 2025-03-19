import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/brands_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/brands_model/BrandsResponse.dart';

class BrandsDataSourceImpl implements BrandsDataSourceContract {
  final ApiManager apiManager;

  BrandsDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BrandsResponse, String>> getAllBrands() async {
    try {
      var response = await apiManager.getRequest(
        baseUrl: Constants.baseUrl,
        endPoint: EndPoints.allBrandsEndPoint,
      );
      BrandsResponse brandsResponse = BrandsResponse.fromJson(response);
      return Left(brandsResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
