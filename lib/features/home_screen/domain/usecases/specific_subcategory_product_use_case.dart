import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/specific_subcategory_products_repo.dart';

class SpecificSubCategoryProductUseCase {
  final SpecificSubCategoryProductRepo specificSubCategoryProductRepo;

  SpecificSubCategoryProductUseCase(
      {required this.specificSubCategoryProductRepo});

  Future<Either<List<ProductEntity>, String>> call(
      {required String subCategoryId}) async {
    return await specificSubCategoryProductRepo.getSpecificSubCategoryProducts(
        subCategoryId: subCategoryId);
  }
}
