import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/BrandEntity.dart';

abstract class BrandRepo {
  Future<Either<List<BrandEntity>, String>> getBrands();
}
