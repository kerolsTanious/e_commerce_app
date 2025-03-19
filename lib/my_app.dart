import 'package:e_commerce_app_route/core/di.dart';
import 'package:e_commerce_app_route/core/utils/color_manager.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/views/sign_in.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/get_cart/get_cart_cubit.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/brands_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/product_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/brands_cubit/brands_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/categories_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_screen_body_change/category_screen_body_chane_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/change_home_screen_body/change_home_screen_body_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_by_brand_cubit/product_by_brand_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_cubit/product_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/products_category/products_category_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/update_profile_cubit/update_profile_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CategoriesCubit(getIt.get<CategoryUseCase>())
                ..fetchAllCategories(),
            ),
            BlocProvider(
              create: (context) => BrandsCubit(
                getIt.get<BrandUseCase>(),
              )..fetchAllBrands(),
            ),
            BlocProvider(
              create: (context) => ProductCubit(
                getIt.get<ProductUseCase>(),
              )..fetchAllProduct(),
            ),
            BlocProvider(
              create: (context) => BottomNavigationCubit(),
            ),
            BlocProvider(
              create: (context) => getIt.get<GetCartCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<UpdateCartCubit>(),
            ),
            BlocProvider(
              create: (context) => CategoryScreenBodyChangeCubit(),
            ),
            BlocProvider(
              create: (context) => getIt.get<UpdateProfileCubit>(),
            ),
            BlocProvider(
              create: (context) => ChangeHomeScreenBodyCubit(),
            ),
            BlocProvider(
              create: (context) => getIt.get<ProductsCategoryCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt.get<ProductByBrandCubit>(),
            ),
          ],
          child: MaterialApp(
            home: PrefsHelper.getToken().isNotEmpty
                ? const HomeScreen()
                : const SignIn(initialEmail: ""),
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: ColorManager.primaryColor,
                )),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
