import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/category_repo.dart';

class CategoryUseCase {
  final CategoryRepo categoryRepo;

  CategoryUseCase({required this.categoryRepo});

  Future<Either<List<CategoryEntity>, String>> call() async {
    return await categoryRepo.getAllCategories();
  }
}
