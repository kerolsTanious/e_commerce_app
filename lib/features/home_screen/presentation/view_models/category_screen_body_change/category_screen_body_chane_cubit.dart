import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_screen_body_change/category_screen_body_chane_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreenBodyChangeCubit extends Cubit<CategoryScreenBodyChangeState> {
  CategoryScreenBodyChangeCubit() : super(CategoryScreenBodyChangeInitial());
  int currentIndex = 0;

  static CategoryScreenBodyChangeCubit getCategoryScreenBodyChangeCubit(BuildContext context){
    return BlocProvider.of(context);
  }

  void changeCurrentIndex(int newIndex){
    currentIndex = newIndex;
    emit(CategoryScreenBodyChange(newIndex: currentIndex));
  }
}
