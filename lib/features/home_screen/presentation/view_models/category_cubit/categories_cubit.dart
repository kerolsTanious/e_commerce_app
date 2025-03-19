import 'package:e_commerce_app_route/features/home_screen/domain/usecases/category_use_case.dart';
import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoryUseCase) : super(CategoriesInitial());
  final CategoryUseCase categoryUseCase;

  Future<void> fetchAllCategories() async {
    emit(CategoriesLoading());

    var result = await categoryUseCase.call();
    result.fold(
      (categories) {
        emit(CategoriesSuccess(categories: categories));
      },
      (error) {
        emit(CategoriesFailure(errorMessage: error));
      },
    );
  }
}
