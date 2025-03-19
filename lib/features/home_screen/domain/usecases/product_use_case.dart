import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/product_repo.dart';

class ProductUseCase {
  final ProductRepo productRepo;

  ProductUseCase({required this.productRepo});

  Future<Either<List<ProductEntity>, String>> call() async {
    return await productRepo.getAllProducts();
  }
}
