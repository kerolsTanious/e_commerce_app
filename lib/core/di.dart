import 'package:dio/dio.dart';
import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/stripe/stripe_manager.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_impl/create_cusmtomer_datasource_impl.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_impl/login_datasorce_impl.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/datasource_impl/sign_up_datasource_impl.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/repo_impl/create_customer_repo_impl.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/repo_impl/login_repo_impl.dart';
import 'package:e_commerce_app_route/features/auth_screen/data/repo_impl/sign_up_repo_impl.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/usecase/create_customer_use_case.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/usecase/login_use_case.dart';
import 'package:e_commerce_app_route/features/auth_screen/domain/usecase/sign_up_use_case.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/create_customer_stripe/create_customer_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/login/login_cubit.dart';
import 'package:e_commerce_app_route/features/auth_screen/presentation/view_models/sign_up/sign_up_cubit.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_impl/add_cart_datasource_impl.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_impl/delete_datasource_impl.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_impl/get_cart_datasource_impl.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_impl/update_cart_datasource_impl.dart';
import 'package:e_commerce_app_route/features/cart/data/repo_impl/add_cart_repo_impl.dart';
import 'package:e_commerce_app_route/features/cart/data/repo_impl/delete_item-repo_impl.dart';
import 'package:e_commerce_app_route/features/cart/data/repo_impl/get_cart_repo_impl.dart';
import 'package:e_commerce_app_route/features/cart/data/repo_impl/update_cart_repo_impl.dart';
import 'package:e_commerce_app_route/features/cart/domain/use_case/add_cart_use_ase.dart';
import 'package:e_commerce_app_route/features/cart/domain/use_case/delete_cart_use_case.dart';
import 'package:e_commerce_app_route/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:e_commerce_app_route/features/cart/domain/use_case/update_cart_use_case.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/get_cart/get_cart_cubit.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/brands_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/category_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/product_by_brand_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/product_category_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/product_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/specfic_subcategory_product_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/sub_category_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/datasource_impl/update_profile_datasource_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/brands_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/category_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/product_by_brand_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/product_category_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/product_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/specific_subcategory_product_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/sub_category_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/data/repo_impl/update_profile_repo_impl.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/brands_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/product_by_brand_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/product_category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/product_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/specific_subcategory_product_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/sub_category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/usecases/update_profile_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_by_brand_cubit/product_by_brand_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/products_category/products_category_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/specific_subcategory_product_cubit/specific_sub_category_product_cubit.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/update_profile_cubit/update_profile_cubit.dart';
import 'package:e_commerce_app_route/features/payment/data/datasource_impl/payment_datasource_impl.dart';
import 'package:e_commerce_app_route/features/payment/data/repo_impl/payment_repo_impl.dart';
import 'package:e_commerce_app_route/features/payment/domain/usecase/payment_usecase.dart';
import 'package:e_commerce_app_route/features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiManager>(
    ApiManager(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton<CategoryDataSourceImpl>(
    CategoryDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<CategoryRepoImpl>(
    CategoryRepoImpl(
      categoryDataSourceContract: getIt.get<CategoryDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<CategoryUseCase>(
    CategoryUseCase(
      categoryRepo: getIt.get<CategoryRepoImpl>(),
    ),
  );
  getIt.registerSingleton<BrandsDataSourceImpl>(
    BrandsDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<BrandRepoImpl>(
    BrandRepoImpl(
      brandsDataSourceContract: getIt.get<BrandsDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<BrandUseCase>(
    BrandUseCase(
      brandRepo: getIt.get<BrandRepoImpl>(),
    ),
  );
  getIt.registerSingleton<ProductDataSourceImpl>(
    ProductDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(
      productDataSourceContract: getIt.get<ProductDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<ProductUseCase>(
    ProductUseCase(
      productRepo: getIt.get<ProductRepoImpl>(),
    ),
  );
  getIt.registerSingleton<SubCategoryDataSourceImpl>(
    SubCategoryDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<SubCategoryRepoImpl>(
    SubCategoryRepoImpl(
      subcategoryDatasourceContract: getIt.get<SubCategoryDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<SubCategoryUseCase>(
    SubCategoryUseCase(
      subCategoryRepo: getIt.get<SubCategoryRepoImpl>(),
    ),
  );
  getIt.registerSingleton<SignUpDatasourceImpl>(
    SignUpDatasourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<SignUpRepoImpl>(
    SignUpRepoImpl(
      signUpDatasourceContract: getIt.get<SignUpDatasourceImpl>(),
    ),
  );
  getIt.registerSingleton<SignUpUseCase>(
    SignUpUseCase(
      signUpRepo: getIt.get<SignUpRepoImpl>(),
    ),
  );
  getIt.registerSingleton<SignUpCubit>(
    SignUpCubit(
      getIt.get<SignUpUseCase>(),
    ),
  );
  getIt.registerSingleton<LoginDataSourceImpl>(
    LoginDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      loginDataSourceContract: getIt.get<LoginDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<LoginUseCAse>(
    LoginUseCAse(
      loginRepo: getIt.get<LoginRepoImpl>(),
    ),
  );
  getIt.registerSingleton<LoginCubit>(
    LoginCubit(
      loginUseCAse: getIt.get<LoginUseCAse>(),
    ),
  );

  getIt.registerSingleton<AddCartDataSourceImpl>(
    AddCartDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<AddCartRepoImpl>(
    AddCartRepoImpl(
      addCartDatasourceContract: getIt.get<AddCartDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<AddCartUseCase>(
    AddCartUseCase(
      addCartRepo: getIt.get<AddCartRepoImpl>(),
    ),
  );
  getIt.registerSingleton<GetCartDataSourceImpl>(
    GetCartDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<GetCartRepoImpl>(
    GetCartRepoImpl(
      getCartDataSourceContract: getIt.get<GetCartDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<GetCartUseCase>(
    GetCartUseCase(
      getCartRepo: getIt.get<GetCartRepoImpl>(),
    ),
  );
  getIt.registerSingleton<GetCartCubit>(
    GetCartCubit(
      getCartUseCase: getIt.get<GetCartUseCase>(),
    ),
  );

  getIt.registerSingleton<UpdateCartDatasourceImpl>(
    UpdateCartDatasourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<UpdateCartRepoImpl>(
    UpdateCartRepoImpl(
      updateDataSourceContract: getIt.get<UpdateCartDatasourceImpl>(),
    ),
  );
  getIt.registerSingleton<UpdateCartUseCase>(
    UpdateCartUseCase(
      updateCartRepo: getIt.get<UpdateCartRepoImpl>(),
    ),
  );
  getIt.registerSingleton<DeleteDatasourceImpl>(
    DeleteDatasourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<DeleteItemRepoImpl>(
    DeleteItemRepoImpl(
      deleteDataSourceContract: getIt.get<DeleteDatasourceImpl>(),
    ),
  );
  getIt.registerSingleton<DeleteCartItemUseCase>(
    DeleteCartItemUseCase(
      deleteCartRepo: getIt.get<DeleteItemRepoImpl>(),
    ),
  );
  getIt.registerSingleton<UpdateCartCubit>(
    UpdateCartCubit(
        addCartUseCase: getIt.get<AddCartUseCase>(),
        updateCartUseCase: getIt.get<UpdateCartUseCase>(),
        deleteCartItemUseCase: getIt.get<DeleteCartItemUseCase>()),
  );

  getIt.registerSingleton<SpecificSubcategoryProductDatasourceImpl>(
    SpecificSubcategoryProductDatasourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<SpecificSubCategoryProductRepoImpl>(
    SpecificSubCategoryProductRepoImpl(
      specificSubcategoryProductDatasourceContract:
          getIt.get<SpecificSubcategoryProductDatasourceImpl>(),
    ),
  );
  getIt.registerSingleton<SpecificSubCategoryProductUseCase>(
    SpecificSubCategoryProductUseCase(
      specificSubCategoryProductRepo:
          getIt.get<SpecificSubCategoryProductRepoImpl>(),
    ),
  );
  getIt.registerSingleton<SpecificSubCategoryProductCubit>(
    SpecificSubCategoryProductCubit(
      specificSubCategoryProductUseCase:
          getIt.get<SpecificSubCategoryProductUseCase>(),
    ),
  );
  getIt.registerSingleton<UpdateProfileDataSourceImpl>(
    UpdateProfileDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<UpdateProfileRepoImpl>(
    UpdateProfileRepoImpl(
      updateProfileDatasourceContract: getIt.get<UpdateProfileDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<UpdateProfileUseCase>(
    UpdateProfileUseCase(
      updateProfileRepo: getIt.get<UpdateProfileRepoImpl>(),
    ),
  );
  getIt.registerSingleton<UpdateProfileCubit>(
    UpdateProfileCubit(
      updateProfileUseCase: getIt.get<UpdateProfileUseCase>(),
    ),
  );
  getIt.registerSingleton<ProductCategoryDatasourceImpl>(
    ProductCategoryDatasourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<ProductCategoryRepoImpl>(
    ProductCategoryRepoImpl(
      productCategoryDatasourceContract:
          getIt.get<ProductCategoryDatasourceImpl>(),
    ),
  );
  getIt.registerSingleton<ProductCategoryUseCase>(
    ProductCategoryUseCase(
      productsCategoryRepo: getIt.get<ProductCategoryRepoImpl>(),
    ),
  );
  getIt.registerSingleton<ProductsCategoryCubit>(
    ProductsCategoryCubit(
      productCategoryUseCase: getIt.get<ProductCategoryUseCase>(),
    ),
  );
  getIt.registerSingleton<ProductByBrandDatasourceImpl>(
    ProductByBrandDatasourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<ProductByBrandRepoImpl>(
    ProductByBrandRepoImpl(
      productByBrandDatasourceContract:
          getIt.get<ProductByBrandDatasourceImpl>(),
    ),
  );
  getIt.registerSingleton<ProductByBrandUseCase>(
    ProductByBrandUseCase(
      productByBrandRepo: getIt.get<ProductByBrandRepoImpl>(),
    ),
  );
  getIt.registerSingleton<ProductByBrandCubit>(
    ProductByBrandCubit(
      productByBrandUseCase: getIt.get<ProductByBrandUseCase>(),
    ),
  );
  getIt.registerSingleton<PaymentDataSourceImpl>(
    PaymentDataSourceImpl(
      stripeManager: StripeManager(
        apiManager: getIt.get<ApiManager>(),
      ),
    ),
  );
  getIt.registerSingleton<PaymentRepoImpl>(
    PaymentRepoImpl(
      paymentDataSourceContract: getIt.get<PaymentDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<PaymentUseCase>(
    PaymentUseCase(
      paymentRepoContract: getIt.get<PaymentRepoImpl>(),
    ),
  );
  getIt.registerSingleton<PaymentCubit>(
    PaymentCubit(
      paymentUseCase: getIt.get<PaymentUseCase>(),
    ),
  );
  getIt.registerSingleton<CreateCustomerDataSourceImpl>(
    CreateCustomerDataSourceImpl(
      apiManager: getIt.get<ApiManager>(),
    ),
  );
  getIt.registerSingleton<CreateCustomerRepoImpl>(
    CreateCustomerRepoImpl(
      createCustomerDatasourceContract:
          getIt.get<CreateCustomerDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<CreateCustomerUseCase>(
    CreateCustomerUseCase(
      createCustomerRepo: getIt.get<CreateCustomerRepoImpl>(),
    ),
  );
  getIt.registerSingleton<CreateCustomerCubit>(
    CreateCustomerCubit(
      createCustomerUseCase: getIt.get<CreateCustomerUseCase>(),
    ),
  );
}
