import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/product_category_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductModel.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/products_category_repo.dart';

class ProductCategoryRepoImpl extends ProductsCategoryRepo {
  final ProductCategoryDatasourceContract productCategoryDatasourceContract;

  ProductCategoryRepoImpl({required this.productCategoryDatasourceContract});

  @override
  Future<Either<List<ProductEntity>, String>> getProductByCategory(
      {required String categoryId}) async {
    var result = await productCategoryDatasourceContract
        .getAllProductByCategory(categoryId: categoryId);
    return result.fold(
      (response) {
        List<ProductModel> productModeList = response.data ?? [];
        List<ProductEntity> productEntityList = [];
        for (ProductModel productModel in productModeList) {
          productEntityList.add(productModel.toProductEntity());
        }
        return Left(productEntityList);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
