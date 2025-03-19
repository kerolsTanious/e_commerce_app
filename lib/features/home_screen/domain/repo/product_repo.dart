import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';

abstract class ProductRepo {
  Future<Either<List<ProductEntity>, String>> getAllProducts();

}
