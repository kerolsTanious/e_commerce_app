import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/CategoryEntity.dart';

abstract class CategoryRepo {
  Future<Either<List<CategoryEntity>, String>> getAllCategories();
}