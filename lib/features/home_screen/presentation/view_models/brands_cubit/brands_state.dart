import 'package:e_commerce_app_route/features/home_screen/domain/entities/BrandEntity.dart';

abstract class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsSuccess extends BrandsState {
  final List<BrandEntity> brands;

  BrandsSuccess({required this.brands});
}

final class BrandsFailure extends BrandsState {
  final String errorMessage;

  BrandsFailure({required this.errorMessage});
}
