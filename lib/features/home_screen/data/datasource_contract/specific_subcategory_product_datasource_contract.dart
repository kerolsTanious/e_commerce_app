import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductResponse.dart';

abstract class SpecificSubcategoryProductDatasourceContract {
  Future<Either<ProductResponse,String>> getSpecificSubCategoryProducts({required String subCategoryId});
}