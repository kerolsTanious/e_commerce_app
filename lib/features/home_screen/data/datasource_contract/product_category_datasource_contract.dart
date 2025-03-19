import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductResponse.dart';

abstract class ProductCategoryDatasourceContract {
  Future<Either<ProductResponse, String>> getAllProductByCategory(
      {required String categoryId});
}
