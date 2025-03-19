import 'package:e_commerce_app_route/features/home_screen/domain/usecases/sub_category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/sub_category_cubit/sub_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit(this.subCategoryUseCase) : super(SubCategoryInitial());
  final SubCategoryUseCase subCategoryUseCase;

  Future<void> fetchAllSubCategory({required String id}) async {
    emit(SubCategoryLoading());
    var result = await subCategoryUseCase.call(id: id);
    result.fold(
      (response) {
        emit(SubCategorySuccess(data: response));
      },
      (error) {
        emit(SubCategoryFailure(errorMessage: error));
      },
    );
  }
}
