import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';

abstract class SpecificSubCategoryProductState {}

final class SpecificSubCategoryProductInitial
    extends SpecificSubCategoryProductState {}

final class SpecificSubCategoryProductLoading
    extends SpecificSubCategoryProductState {}

final class SpecificSubCategoryProductSuccess
    extends SpecificSubCategoryProductState {
  final List<ProductEntity> listProductEntity;

  SpecificSubCategoryProductSuccess({required this.listProductEntity});
}

final class SpecificSubCategoryProductIFailure
    extends SpecificSubCategoryProductState {
  final String errorMessage;

  SpecificSubCategoryProductIFailure({required this.errorMessage});
}
