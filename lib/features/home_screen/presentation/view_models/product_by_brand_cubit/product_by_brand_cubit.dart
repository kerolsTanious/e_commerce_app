import 'package:e_commerce_app_route/features/home_screen/domain/usecases/product_by_brand_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_by_brand_cubit/product_by_brand_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByBrandCubit extends Cubit<ProductByBrandState> {
  ProductByBrandCubit({required this.productByBrandUseCase})
      : super(ProductByBrandInitial());
  final ProductByBrandUseCase productByBrandUseCase;

  Future<void> fetchProductsByBrand({required String brandId}) async {
    emit(ProductByBrandLoading());
    var result = await productByBrandUseCase.call(brandId: brandId);
    result.fold(
      (response) {
        emit(ProductByBrandSuccess(productEntityList: response));
      },
      (error) {
        emit(ProductByBrandFailure(error: error));
      },
    );
  }
}
