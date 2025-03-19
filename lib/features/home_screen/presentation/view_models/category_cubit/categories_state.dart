import 'package:e_commerce_app_route/features/home_screen/domain/entities/CategoryEntity.dart';

abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> categories;

  CategoriesSuccess({required this.categories});
}

final class CategoriesFailure extends CategoriesState {
  final String errorMessage;

  CategoriesFailure({required this.errorMessage});
}
