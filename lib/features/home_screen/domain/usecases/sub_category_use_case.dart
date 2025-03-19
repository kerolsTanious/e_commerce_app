import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/SubCategoryEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/sub_category_repo.dart';

class SubCategoryUseCase {
  final SubCategoryRepo subCategoryRepo;

  SubCategoryUseCase({required this.subCategoryRepo});

  Future<Either<List<SubCategoryEntity>, String>> call(
      {required String id}) async {
    return await subCategoryRepo.getSubCategory(id: id);
  }
}
