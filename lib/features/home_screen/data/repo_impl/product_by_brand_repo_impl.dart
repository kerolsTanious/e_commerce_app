import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/product_by_brand_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductModel.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/product_by_brand_repo.dart';

class ProductByBrandRepoImpl extends ProductByBrandRepo {
  final ProductByBrandDatasourceContract productByBrandDatasourceContract;

  ProductByBrandRepoImpl({required this.productByBrandDatasourceContract});

  @override
  Future<Either<List<ProductEntity>, String>> getProductsByBrand(
      {required String brandId}) async {
    var result = await productByBrandDatasourceContract.getProductsByBrand(
      brandId: brandId,
    );
    return result.fold(
      (response) {
        List<ProductModel> productModelList = response.data ?? [];
        List<ProductEntity> productEntityList = [];
        for (ProductModel productModelItem in productModelList) {
          productEntityList.add(productModelItem.toProductEntity());
        }
        return Left(productEntityList);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
