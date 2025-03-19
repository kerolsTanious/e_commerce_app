import 'package:e_commerce_app_route/features/home_screen/domain/usecases/product_category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/products_category/products_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCategoryCubit extends Cubit<ProductsCategoryState> {
  ProductsCategoryCubit({required this.productCategoryUseCase})
      : super(ProductsCategoryInitial());
  final ProductCategoryUseCase productCategoryUseCase;

  Future<void> fetchProductByCategory({required String categoryId}) async {
    emit(ProductsCategoryLoading());
    var result = await productCategoryUseCase.getProductByCategory(
        categoryId: categoryId);
    result.fold(
      (response) {
        emit(ProductsCategorySuccess(productEntityList: response));
      },
      (error) {
        emit(ProductsCategoryFailure(error: error));
      },
    );
  }
}
