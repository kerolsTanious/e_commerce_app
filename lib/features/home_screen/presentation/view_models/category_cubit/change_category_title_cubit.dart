import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_title_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCategoryTitleCubit extends Cubit<ChangeCategoryTitleState> {
  ChangeCategoryTitleCubit()
      : super(ChangeCategoryTitleInitial());

  String categoryTitle = "Music";

  void changeCategoryTitle(String changedCategoryTitle) {
    categoryTitle = changedCategoryTitle;
    emit(ChangeCategoryTitleSuccess());
  }
}
