import 'package:e_commerce_app_route/features/home_screen/domain/entities/SubCategoryEntity.dart';

abstract class SubCategoryState {}

final class SubCategoryInitial extends SubCategoryState {}

final class SubCategorySuccess extends SubCategoryState {
  final List<SubCategoryEntity> data;

  SubCategorySuccess({required this.data});
}

final class SubCategoryFailure extends SubCategoryState {
  final String errorMessage;

  SubCategoryFailure({required this.errorMessage});
}

final class SubCategoryLoading extends SubCategoryState {}
