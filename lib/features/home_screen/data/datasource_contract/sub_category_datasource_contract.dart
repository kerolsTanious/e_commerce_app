import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/sub_category_model/SubCategoryResponse.dart';

abstract class SubcategoryDatasourceContract {
  Future<Either<SubCategoryResponse, String>> getSubCategory ({required String id});
}