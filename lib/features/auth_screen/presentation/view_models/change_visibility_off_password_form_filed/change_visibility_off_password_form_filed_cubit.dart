import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/change_visibility_off_password_form_filed/change_visibility_off_password_form_filed_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeVisibilityOffPasswordFormFiledCubit
    extends Cubit<ChangeVisibilityOffPasswordFormFiledState> {
  ChangeVisibilityOffPasswordFormFiledCubit()
      : super(ChangeVisibilityOffPasswordFormFiledInitial());

  static ChangeVisibilityOffPasswordFormFiledCubit get(BuildContext context) =>
      BlocProvider.of(context);

  bool changedObscureText = true;
  bool changedObscureTextConfirmPassword = true;

  void changeObscureText({required bool obscureText}) {
    changedObscureText = obscureText;
    emit(
      ChangeVisibilityOffPasswordFormFiledSuccess(),
    );
  }
  void changeObscureTextConfirmPassword({required bool obscureTextConfirmPassword}) {
    changedObscureTextConfirmPassword = obscureTextConfirmPassword;
    emit(
      ChangeVisibilityOffPasswordFormFiledSuccess(),
    );
  }
}
