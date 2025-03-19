import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/resuable_components/custom_auth_buttom.dart';
import 'package:e_commerce_app_route/core/resuable_components/custom_text_form_filed.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/core/utils/strings_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/change_visibility_off_password_form_filed/change_visibility_off_password_form_filed_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/change_visibility_off_password_form_filed/change_visibility_off_password_form_filed_state.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/create_customer_stripe/create_customer_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/create_customer_stripe/create_customer_state.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/sign_up/sign_up_state.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthSignUpBody extends StatefulWidget {
  const AuthSignUpBody({super.key});

  @override
  State<AuthSignUpBody> createState() => _AuthSignUpBodyState();
}

class _AuthSignUpBodyState extends State<AuthSignUpBody> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeVisibilityOffPasswordFormFiledCubit,
        ChangeVisibilityOffPasswordFormFiledState>(
      builder: (context, state) {
        return BlocListener<CreateCustomerCubit, CreateCustomerState>(
          listener: (context, state) {
            if (state is CreateCustomerSuccess) {
              PrefsHelper.setString(
                  key: PrefsKeys.customerId,
                  value: state.createCustomerResponseModel.id ?? "");
            }
            if (state is CreateCustomerFailure) {
              print("error ==============> ${state.errorMessage}");
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Form(
              key: formKey,
              child: SafeArea(
                child: ListView(
                  children: [
                    CustomTextFormFiled(
                      titleText: StringManager.fullName,
                      hintText: StringManager.enterYourFullName,
                      prefixIcon: const Icon(Icons.person_outline),
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return StringManager.emptyFullName;
                        }
                        return null;
                      },
                      controller: nameController,
                    ),
                    SizedBox(height: 75.h),
                    CustomTextFormFiled(
                      titleText: StringManager.mobileNumber,
                      hintText: StringManager.enterYourMobileNo,
                      prefixIcon: const Icon(Icons.phone_outlined),
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return StringManager.emptyMobilNumber;
                        } else if (!(Constants.mobileNumberRegex)
                            .hasMatch(value)) {
                          return StringManager.notValidMobileNumber;
                        }
                        return null;
                      },
                      controller: phoneController,
                    ),
                    SizedBox(height: 75.h),
                    CustomTextFormFiled(
                      titleText: StringManager.eMailAddress,
                      hintText: StringManager.enterYourEmailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                    ),
                    SizedBox(height: 75.h),
                    CustomTextFormFiled(
                      titleText: StringManager.password,
                      hintText: StringManager.enterYourPassword,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
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
                      suffixIcon: ChangeVisibilityOffPasswordFormFiledCubit.get(
                                  context)
                              .changedObscureText
                          ? IconButton(
                              onPressed: () {
                                ChangeVisibilityOffPasswordFormFiledCubit.get(
                                        context)
                                    .changeObscureText(
                                        obscureText:
                                            !ChangeVisibilityOffPasswordFormFiledCubit
                                                    .get(context)
                                                .changedObscureText);
                              },
                              icon: const Icon(Icons.visibility_off_outlined),
                            )
                          : IconButton(
                              onPressed: () {
                                ChangeVisibilityOffPasswordFormFiledCubit.get(
                                        context)
                                    .changeObscureText(
                                        obscureText:
                                            !ChangeVisibilityOffPasswordFormFiledCubit
                                                    .get(context)
                                                .changedObscureText);
                              },
                              icon: const Icon(Icons.visibility_outlined),
                            ),
                      obscureText:
                          ChangeVisibilityOffPasswordFormFiledCubit.get(context)
                              .changedObscureText,
                    ),
                    SizedBox(height: 75.h),
                    CustomTextFormFiled(
                      titleText: StringManager.confirmPassword,
                      hintText: StringManager.enterYourPassword,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value != passwordController.text) {
                          return StringManager.dontMatchPassword;
                        } else if (value!.isEmpty) {
                          return StringManager.emptyConfirmPassword;
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      suffixIcon: ChangeVisibilityOffPasswordFormFiledCubit.get(
                                  context)
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
                      obscureText:
                          ChangeVisibilityOffPasswordFormFiledCubit.get(context)
                              .changedObscureTextConfirmPassword,
                    ),
                    SizedBox(height: 65.h),
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpSuccess) {
                          Fluttertoast.showToast(
                              msg: "Account Created Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(
                                initialEmail: emailController.text,
                              ),
                            ),
                          );
                          PrefsHelper.setString(
                            key: PrefsKeys.name,
                            value: nameController.text,
                          );
                          PrefsHelper.setString(
                            key: PrefsKeys.password,
                            value: passwordController.text,
                          );
                          PrefsHelper.setString(
                            key: PrefsKeys.email,
                            value: emailController.text,
                          );
                          PrefsHelper.setString(
                            key: PrefsKeys.mobileNumber,
                            value: phoneController.text,
                          );
                        }
                        if (state is SignUpFailure) {
                          Fluttertoast.showToast(
                            msg: state.errorMessage,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is SignUpLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return CustomAuthButton(
                          buttonTitle: StringManager.signUp,
                          onTap: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              SignUpCubit.getSignUpCubit(context).createAccount(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                resetPassword: confirmPasswordController.text,
                                mobileNumber: phoneController.text,
                              );
                            }
                            await getIt
                                .get<CreateCustomerCubit>()
                                .createCustomerStripe();
                          },
                        );
                      },
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have Account  ",
                          style: TextStylesManager.textStyle18.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(
                                  initialEmail: emailController.text,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStylesManager.textStyle18.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
