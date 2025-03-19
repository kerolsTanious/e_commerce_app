import 'package:e_commerce_app_route/features/auth_screen/domain/usecase/sign_up_use_case.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/sign_up/sign_up_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  final SignUpUseCase signUpUseCase;

  static SignUpCubit getSignUpCubit(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
    required String resetPassword,
    required String mobileNumber,
  }) async {
    emit(SignUpLoading());
    var result = await signUpUseCase.call(
      name: name,
      email: email,
      password: password,
      resetPassword: resetPassword,
      mobileNumber: mobileNumber,
    );
    result.fold(
      (response) {
        emit(SignUpSuccess(token: response.token ?? ""));
        print("token===========> ${response.token}");
      },
      (error) {
        emit(SignUpFailure(errorMessage: error));
      },
    );
  }
}
