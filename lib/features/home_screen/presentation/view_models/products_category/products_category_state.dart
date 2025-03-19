import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';

abstract class ProductsCategoryState {}

final class ProductsCategoryInitial extends ProductsCategoryState {}

final class ProductsCategoryLoading extends ProductsCategoryState {}

final class ProductsCategorySuccess extends ProductsCategoryState {
  final List<ProductEntity> productEntityList;

  ProductsCategorySuccess({required this.productEntityList});
}

final class ProductsCategoryFailure extends ProductsCategoryState {
  final String error;

  ProductsCategoryFailure({required this.error});
}
