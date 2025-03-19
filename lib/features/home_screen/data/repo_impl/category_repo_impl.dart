import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_contract/category_datasource_contract.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryDataSourceContract categoryDataSourceContract;

  CategoryRepoImpl({required this.categoryDataSourceContract});

  @override
  Future<Either<List<CategoryEntity>, String>> getAllCategories() async {
    var result = await categoryDataSourceContract.getCategories();
    return result.fold(
      (response) {
        var categoriesResponse = response.data ?? [];
        List<CategoryEntity> categoriesEntityList = [];
        for (var category in categoriesResponse) {
          categoriesEntityList.add(category.toCategoryEntity());
        }
        return Left(categoriesEntityList);
      },
      (error) {
        return Right(error.toString());
      },
    );
  }
}
