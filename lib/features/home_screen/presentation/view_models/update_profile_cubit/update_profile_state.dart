import 'package:e_commerce_app_route/features/home_screen/domain/entities/update_profile_entity/UpadateProfileResponseEntity.dart';

abstract class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final UpdateProfileResponseEntity updateProfileResponseEntity;

  UpdateProfileSuccess({required this.updateProfileResponseEntity});
}

final class UpdateProfileFailure extends UpdateProfileState {
  final String error;

  UpdateProfileFailure({required this.error});
}
