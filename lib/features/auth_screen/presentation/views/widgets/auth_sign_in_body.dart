import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/resuable_components/custom_auth_buttom.dart';
import 'package:e_commerce_app_route/core/resuable_components/custom_text_form_filed.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/change_visibility_off_password_form_filed/change_visibility_off_password_form_filed_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/change_visibility_off_password_form_filed/change_visibility_off_password_form_filed_state.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/create_customer_stripe/create_customer_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/create_customer_stripe/create_customer_state.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/login/login_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/login/login_state.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/views/sign_up.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/strings_manager.dart';

class AuthSignInBody extends StatefulWidget {
  const AuthSignInBody({
    super.key,
    required this.initialEmail,
  });

  final String initialEmail;

  @override
  State<AuthSignInBody> createState() => _AuthSignInBodyState();
}

class _AuthSignInBodyState extends State<AuthSignInBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _AuthSignInBodyState();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.initialEmail);
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeVisibilityOffPasswordFormFiledCubit,
        ChangeVisibilityOffPasswordFormFiledState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SafeArea(
              child: ListView(
                children: [
                  SizedBox(height: 90.h),
                  Text(
                    StringManager.welcomeMessage,
                    style: TextStylesManager.textStyle24,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    StringManager.pleaseSignIn,
                    style: TextStylesManager.textStyle16,
                  ),
                  SizedBox(height: 85.h),
                  CustomTextFormFiled(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringManager.emptyEmail;
                      } else if (!(Constants.emailRegex).hasMatch(value)) {
                        return StringManager.notValidEmail;
                      } else if (!(Constants.gmailRegex).hasMatch(value)) {
                        return StringManager.notValidEmail;
                      }
                      return null;
                    },
                    controller: emailController,
                    titleText: StringManager.eMailAddress,
                    hintText: StringManager.enterYourEmailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 75.h),
                  CustomTextFormFiled(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return StringManager.emptyPassword;
                      } else if (value.length < 8) {
                        return StringManager.shortPassword;
                      } else if (!(Constants.passwordRegex).hasMatch(value)) {
                        return StringManager.notValidPassword;
                      }
                      return null;
                    },
                    controller: passwordController,
                    titleText: StringManager.password,
                    hintText: StringManager.enterYourPassword,
                    prefixIcon: const Icon(Icons.lock_outlined),
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText:
                        ChangeVisibilityOffPasswordFormFiledCubit.get(context)
                            .changedObscureTextConfirmPassword,
                    suffixIcon:
                        ChangeVisibilityOffPasswordFormFiledCubit.get(context)
                                .changedObscureTextConfirmPassword
                            ? IconButton(
                                onPressed: () {
                                  ChangeVisibilityOffPasswordFormFiledCubit.get(
                                          context)
                                      .changeObscureTextConfirmPassword(
                                          obscureTextConfirmPassword:
                                              !ChangeVisibilityOffPasswordFormFiledCubit
                                                      .get(context)
                                                  .changedObscureTextConfirmPassword);
                                },
                                icon: const Icon(Icons.visibility_off_outlined),
                              )
                            : IconButton(
                                onPressed: () {
                                  ChangeVisibilityOffPasswordFormFiledCubit.get(
                                          context)
                                      .changeObscureTextConfirmPassword(
                                    obscureTextConfirmPassword:
                                        !ChangeVisibilityOffPasswordFormFiledCubit
                                                .get(context)
                                            .changedObscureTextConfirmPassword,
                                  );
                                },
                                icon: const Icon(Icons.visibility_outlined),
                              ),
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forget password",
                      style: TextStylesManager.textStyle18.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 55.h),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        Fluttertoast.showToast(
                          msg: state.errorMessage,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        print("error ===========> ${state.errorMessage}");
                      }
                      if (state is LoginSuccess) {
                        PrefsHelper.setToken(token: state.token);
                        Fluttertoast.showToast(
                          msg: StringManager.loginSuccessfully,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      return CustomAuthButton(
                        buttonTitle: StringManager.login,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            LoginCubit.getLoginCubit(context).login(
                              email: emailController.text.isEmpty
                                  ? widget.initialEmail
                                  : emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringManager.dontHaveAccount,
                        style: TextStylesManager.textStyle18.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          StringManager.createAccount,
                          style: TextStylesManager.textStyle18.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
