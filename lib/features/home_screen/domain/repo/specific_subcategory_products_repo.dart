import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';

abstract class SpecificSubCategoryProductRepo{
  Future<Either<List<ProductEntity> ,String>> getSpecificSubCategoryProducts({required String subCategoryId});
}