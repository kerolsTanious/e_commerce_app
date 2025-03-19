import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';

abstract class ProductByBrandState {}

final class ProductByBrandInitial extends ProductByBrandState {}

final class ProductByBrandSuccess extends ProductByBrandState {
  final List<ProductEntity> productEntityList;

  ProductByBrandSuccess({required this.productEntityList});
}

final class ProductByBrandFailure extends ProductByBrandState {
  final String error;

  ProductByBrandFailure({required this.error});
}

final class ProductByBrandLoading extends ProductByBrandState {}
