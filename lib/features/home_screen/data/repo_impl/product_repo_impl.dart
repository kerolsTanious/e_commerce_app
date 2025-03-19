import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/product_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/product_model/ProductModel.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductDataSourceContract productDataSourceContract;

  ProductRepoImpl({required this.productDataSourceContract});

  @override
  Future<Either<List<ProductEntity>, String>> getAllProducts() async {
    var result = await productDataSourceContract.getAllProduct();
    return result.fold(
      (response) {
        List<ProductEntity> productsEntityList = [];
        List<ProductModel> productModelList = response.data ?? [];
        for (var item in productModelList) {
          productsEntityList.add(item.toProductEntity());
        }
        return Left(productsEntityList);
      },
      (error) {
        return Right(error);
      },
    );
  }

}
