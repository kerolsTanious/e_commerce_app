import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/SubCategoryEntity.dart';

abstract class SubCategoryRepo{
  Future<Either<List<SubCategoryEntity>, String>> getSubCategory({required String id});
}