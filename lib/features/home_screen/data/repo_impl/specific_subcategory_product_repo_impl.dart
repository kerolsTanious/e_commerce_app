import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/specific_subcategory_product_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductModel.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/specific_subcategory_products_repo.dart';

class SpecificSubCategoryProductRepoImpl
    extends SpecificSubCategoryProductRepo {
  final SpecificSubcategoryProductDatasourceContract
      specificSubcategoryProductDatasourceContract;

  SpecificSubCategoryProductRepoImpl(
      {required this.specificSubcategoryProductDatasourceContract});

  @override
  Future<Either<List<ProductEntity>, String>> getSpecificSubCategoryProducts(
      {required String subCategoryId}) async {
    var result = await specificSubcategoryProductDatasourceContract
        .getSpecificSubCategoryProducts(
      subCategoryId: subCategoryId,
    );
    return result.fold(
      (response) {
        List<ProductEntity> productEntityList = [];
        List<ProductModel> productModelList = response.data ?? [];
        for (ProductModel productModel in productModelList) {
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
