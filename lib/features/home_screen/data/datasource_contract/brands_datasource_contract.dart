import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/brands_model/BrandsResponse.dart';

abstract class BrandsDataSourceContract {
  Future<Either<BrandsResponse, String>> getAllBrands();
}
