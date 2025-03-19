import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/category_model/category_response.dart';

abstract class CategoryDataSourceContract {
  Future<Either<CategoryResponse, String>> getCategories();
}
