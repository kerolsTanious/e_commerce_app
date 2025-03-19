import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/change_visibility_off_password_form_filed/change_visibility_off_password_form_filed_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/create_customer_stripe/create_customer_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/views/widgets/auth_sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<SignUpCubit>(),
          ),
          BlocProvider(
            create: (context) => ChangeVisibilityOffPasswordFormFiledCubit(),
          ),
          BlocProvider(
            create: (context) => getIt.get<CreateCustomerCubit>(),
          ),
        ],
        child: const AuthSignUpBody(),
      ),
    );
  }
}

