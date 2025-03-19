import 'package:e_commerce_app_route/features/home_screen/domain/usecases/update_profile_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/update_profile_cubit/update_profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit({required this.updateProfileUseCase})
      : super(UpdateProfileInitial());

  final UpdateProfileUseCase updateProfileUseCase;

  static UpdateProfileCubit updateProfileCubit(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> updateProfile({
    required String token,
    required String name,
    required String mobileNumber,
    required String email,
  }) async {
    emit(UpdateProfileLoading());
    var result = await updateProfileUseCase.call(
      token: token,
      name: name,
      mobileNumber: mobileNumber,
      email: email,
    );
    result.fold(
      (response) {
        emit(UpdateProfileSuccess(updateProfileResponseEntity: response));
      },
      (error) {
        emit(UpdateProfileFailure(error: error));
      },
    );
  }
}
