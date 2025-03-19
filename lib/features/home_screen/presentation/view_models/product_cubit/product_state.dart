import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductEntity> productList;

  ProductSuccess({required this.productList});
}

final class ProductFailure extends ProductState {
  final String errorMessage;

  ProductFailure({required this.errorMessage});
}

final class ProductLoading extends ProductState {}
