import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/utils/assets_manager.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view/cart_screen.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/get_cart/get_cart_cubit.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/get_cart/get_cart_state.dart';
import 'package:e_commerce_app_route/features/payment/domain/usecase/payment_usecase.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomHomeScreenAppBar extends StatelessWidget {
  const CustomHomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          height: 90.h,
          width: 90.w,
          AssetsManager.logo2,
        ),
        const Expanded(child: SizedBox()),
        BlocConsumer<GetCartCubit, GetCartState>(
          listener: (context, state) {
            if (state is GetCartSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => PaymentCubit(
                        paymentUseCase: getIt.get<PaymentUseCase>()),
                    child: CartScreen(
                      cartResponseEntity: state.cartResponseEntity,
                    ),
                  ),
                ),
              );
            }
            if (state is GetCartFailure) {
              Fluttertoast.showToast(
                  msg: state.errorMessage,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          builder: (context, state) {
            if (state is GetCartLoading) {
              return SizedBox(
                width: 30.w,
                height: 30.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return IconButton(
              onPressed: () {
                GetCartCubit.getCartCubit(context).fetchCartProducts(
                  token: PrefsHelper.getToken(),
                );
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primaryColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
