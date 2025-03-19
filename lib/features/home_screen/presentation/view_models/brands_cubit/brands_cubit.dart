import 'package:e_commerce_app_route/features/home_screen/domain/usecases/brands_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/brands_cubit/brands_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final BrandUseCase brandUseCase;

  BrandsCubit(this.brandUseCase) : super(BrandsInitial());

  Future<void> fetchAllBrands() async {
    emit(BrandsLoading());
    var result = await brandUseCase.call();
    result.fold(
      (response) {
        emit(BrandsSuccess(brands: response));
      },
      (error) {
        emit(BrandsFailure(errorMessage: error));
      },
    );
  }
}
