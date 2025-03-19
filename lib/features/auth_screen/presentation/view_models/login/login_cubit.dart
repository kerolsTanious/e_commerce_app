import 'package:e_commerce_app_route/features/auth_screen/domain/usecase/login_use_case.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/login/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCAse}) : super(LoginInitial());

  final LoginUseCAse loginUseCAse;

  static LoginCubit getLoginCubit(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result = await loginUseCAse.call(
      email: email,
      password: password,
    );
    result.fold(
      (response) {
        emit(LoginSuccess(token: response.token ?? ''));
      },
      (error) {
        emit(LoginFailure(errorMessage: error));
      },
    );
  }
}
