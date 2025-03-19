import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/BrandEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/repo/brands_repo.dart';

class BrandUseCase {
  final BrandRepo brandRepo;

  BrandUseCase({required this.brandRepo});

  Future<Either<List<BrandEntity>, String>> call() async {
    return await brandRepo.getBrands();
  }
}
