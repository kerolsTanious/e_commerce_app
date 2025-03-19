import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/products_category_repo.dart';

class ProductCategoryUseCase {
  final ProductsCategoryRepo productsCategoryRepo;

  ProductCategoryUseCase({required this.productsCategoryRepo});

  Future<Either<List<ProductEntity>, String>> getProductByCategory(
      {required String categoryId}) async {
    return await productsCategoryRepo.getProductByCategory(categoryId: categoryId);
  }
}
