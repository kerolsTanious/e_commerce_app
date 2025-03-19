import 'package:e_commerce_app_route/features/home_screen/domain/usecases/specific_subcategory_product_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/specific_subcategory_product_cubit/specific_sub_category_product_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecificSubCategoryProductCubit
    extends Cubit<SpecificSubCategoryProductState> {
  SpecificSubCategoryProductCubit(
      {required this.specificSubCategoryProductUseCase})
      : super(SpecificSubCategoryProductInitial());

  final SpecificSubCategoryProductUseCase specificSubCategoryProductUseCase;

  static SpecificSubCategoryProductCubit getSpecificSubCategoryProductCubit(
      BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> fetchSpecificSubCategoryProduct(
      {required String subCategoryId}) async {
    emit(SpecificSubCategoryProductLoading());
    var result = await specificSubCategoryProductUseCase.call(
        subCategoryId: subCategoryId);
    result.fold(
      (response) {
        emit(SpecificSubCategoryProductSuccess(listProductEntity: response));
      },
      (error) {
        emit(SpecificSubCategoryProductIFailure(errorMessage: error));
      },
    );
  }
}
