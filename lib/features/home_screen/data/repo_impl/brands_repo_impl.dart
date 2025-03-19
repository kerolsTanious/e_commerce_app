import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/brands_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/brands_model/brands_model.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/BrandEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/brands_repo.dart';

class BrandRepoImpl implements BrandRepo {
  final BrandsDataSourceContract brandsDataSourceContract;

  BrandRepoImpl({required this.brandsDataSourceContract});

  @override
  Future<Either<List<BrandEntity>, String>> getBrands() async {
    var result = await brandsDataSourceContract.getAllBrands();
    return result.fold(
      (response) {
        List<BrandsModel> brandModelLList = response.data ?? [];
        List<BrandEntity> brandEntityList = [];
        for(var brand in brandModelLList){
          brandEntityList.add(brand.toBrandEntity());
        }
        print(brandEntityList.length);
        return Left(brandEntityList);
      },
      (error) {
        return Right(error.toString());
      },
    );
  }
}
