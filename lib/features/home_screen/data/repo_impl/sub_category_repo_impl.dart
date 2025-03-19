import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/sub_category_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/sub_category_model/SubCategoryModel.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/SubCategoryEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/sub_category_repo.dart';

class SubCategoryRepoImpl implements SubCategoryRepo {
  final SubcategoryDatasourceContract subcategoryDatasourceContract;

  SubCategoryRepoImpl({required this.subcategoryDatasourceContract});

  @override
  Future<Either<List<SubCategoryEntity>, String>> getSubCategory(
      {required String id}) async {
    var result = await subcategoryDatasourceContract.getSubCategory(id: id);
    return result.fold(
      (response) {
        List<SubCategoryEntity> subCategoryEntity = [];
        List<SubCategoryModel> subCategoryModel = response.data ?? [];
        for (var item in subCategoryModel) {
          subCategoryEntity.add(item.toSubCategoryEntity());
        }
        return Left(subCategoryEntity);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
