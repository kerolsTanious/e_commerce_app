import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/resuable_components/custom_auth_buttom.dart';
import 'package:e_commerce_app_route/core/resuable_components/custom_profile_text_form_filed.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/core/utils/strings_manager.dart';
import 'package:e_commerce_app_route/core/utils/text_styles_manager.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/views/sign_in.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/update_profile_cubit/update_profile_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/update_profile_cubit/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          Fluttertoast.showToast(
            msg: "Profile Updated Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          PrefsHelper.setString(
              key: PrefsKeys.name, value: nameController.text);
          PrefsHelper.setString(
              key: PrefsKeys.mobileNumber, value: phoneController.text);
          PrefsHelper.setString(
              key: PrefsKeys.email, value: emailController.text);
        }
        if (state is UpdateProfileFailure) {
          Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        if (state is UpdateProfileSuccess) {
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              children: [
                Text(
                  "Welcome, ${PrefsHelper.getString(key: PrefsKeys.name)}",
                  style: TextStylesManager.textStyle18,
                ),
                SizedBox(height: 10.h),
                Text(
                  PrefsHelper.getString(key: PrefsKeys.email),
                  style: TextStylesManager.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.textColor.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 25.h),
                CustomProfileTextFormFiled(
                  filedTitle: "Your full name",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return StringManager.emptyFullName;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                CustomProfileTextFormFiled(
                  filedTitle: "Your E-mail",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                CustomProfileTextFormFiled(
                  readOnly: true,
                  filedTitle: "Your password",
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
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
                  prefixIcon: const Icon(Icons.lock_outlined),
                ),
                CustomProfileTextFormFiled(
                  filedTitle: "Your mobile number",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return StringManager.emptyMobilNumber;
                    } else if (!(Constants.mobileNumberRegex).hasMatch(value)) {
                      return StringManager.notValidMobileNumber;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.phone_outlined),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomAuthButton(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            getIt.get<UpdateProfileCubit>().updateProfile(
                                  token: PrefsHelper.getToken(),
                                  name: nameController.text,
                                  mobileNumber: phoneController.text,
                                  email: emailController.text,
                                );
                          }
                        },
                        buttonTitle: "Update",
                        backgroundColor: ColorManager.primaryColor,
                        buttonTitleColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomAuthButton(
                        onTap: () {
                          PrefsHelper.removeToken();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SignIn(initialEmail: ""),
                            ),
                            (route) => false,
                          );
                        },
                        buttonTitle: "Logout",
                        backgroundColor: Colors.red.shade700,
                        buttonTitleColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        if (state is UpdateProfileLoading) {
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              children: [
                Text(
                  "Welcome, ${PrefsHelper.getString(key: PrefsKeys.name)}",
                  style: TextStylesManager.textStyle18,
                ),
                SizedBox(height: 10.h),
                Text(
                  PrefsHelper.getString(key: PrefsKeys.email),
                  style: TextStylesManager.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManager.textColor.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 25.h),
                CustomProfileTextFormFiled(
                  filedTitle: "Your full name",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return StringManager.emptyFullName;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                CustomProfileTextFormFiled(
                  filedTitle: "Your E-mail",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                CustomProfileTextFormFiled(
                  readOnly: true,
                  filedTitle: "Your password",
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
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
                  prefixIcon: const Icon(Icons.lock_outlined),
                ),
                CustomProfileTextFormFiled(
                  filedTitle: "Your mobile number",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return StringManager.emptyMobilNumber;
                    } else if (!(Constants.mobileNumberRegex).hasMatch(value)) {
                      return StringManager.notValidMobileNumber;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.phone_outlined),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomAuthButton(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            getIt.get<UpdateProfileCubit>().updateProfile(
                                  token: PrefsHelper.getToken(),
                                  name: nameController.text,
                                  mobileNumber: phoneController.text,
                                  email: emailController.text,
                                );
                          }
                        },
                        buttonTitle: "Update",
                        backgroundColor: ColorManager.primaryColor,
                        buttonTitleColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomAuthButton(
                        onTap: () {
                          PrefsHelper.removeToken();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SignIn(initialEmail: ""),
                            ),
                            (route) => false,
                          );
                        },
                        buttonTitle: "Logout",
                        backgroundColor: Colors.red.shade700,
                        buttonTitleColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            children: [
              Text(
                "Welcome, ${PrefsHelper.getString(key: PrefsKeys.name)}",
                style: TextStylesManager.textStyle18,
              ),
              SizedBox(height: 10.h),
              Text(
                PrefsHelper.getString(key: PrefsKeys.email),
                style: TextStylesManager.textStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManager.textColor.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 25.h),
              CustomProfileTextFormFiled(
                filedTitle: "Your full name",
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyFullName;
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.person_outline),
              ),
              CustomProfileTextFormFiled(
                filedTitle: "Your E-mail",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              CustomProfileTextFormFiled(
                readOnly: true,
                filedTitle: "Your password",
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
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
                prefixIcon: const Icon(Icons.lock_outlined),
              ),
              CustomProfileTextFormFiled(
                filedTitle: "Your mobile number",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                validator: (value) {
                  if (value!.isEmpty) {
                    return StringManager.emptyMobilNumber;
                  } else if (!(Constants.mobileNumberRegex).hasMatch(value)) {
                    return StringManager.notValidMobileNumber;
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.phone_outlined),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: CustomAuthButton(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          getIt.get<UpdateProfileCubit>().updateProfile(
                                token: PrefsHelper.getToken(),
                                name: nameController.text,
                                mobileNumber: phoneController.text,
                                email: emailController.text,
                              );
                        }
                      },
                      buttonTitle: "Update",
                      backgroundColor: ColorManager.primaryColor,
                      buttonTitleColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomAuthButton(
                      onTap: () {
                        PrefsHelper.removeToken();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SignIn(initialEmail: ""),
                          ),
                          (route) => false,
                        );
                      },
                      buttonTitle: "Logout",
                      backgroundColor: Colors.red.shade700,
                      buttonTitleColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
