import 'package:e_commerce_app_route/features/home_screen/domain/usecases/product_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/product_cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUseCase) : super(ProductInitial());
  final ProductUseCase productUseCase;

  Future<void> fetchAllProduct() async {
    emit(ProductLoading());
    var result = await productUseCase.call();
    result.fold(
      (response) {
        emit(ProductSuccess(productList: response));
      },
      (error) {
        emit(ProductFailure(errorMessage: error));
      },
    );
  }
}
