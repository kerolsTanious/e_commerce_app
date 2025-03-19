import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/product_by_brand_repo.dart';

class ProductByBrandUseCase {
  final ProductByBrandRepo productByBrandRepo;

  ProductByBrandUseCase({required this.productByBrandRepo});

  Future<Either<List<ProductEntity>, String>> call(
      {required String brandId}) async {
    return await productByBrandRepo.getProductsByBrand(brandId: brandId);
  }
}
