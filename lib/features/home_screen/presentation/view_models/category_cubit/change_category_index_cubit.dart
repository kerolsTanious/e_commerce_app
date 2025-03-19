import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/category_cubit/change_category_index_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCategoryIndexCubit extends Cubit<ChangeCategoryIndexState> {
  ChangeCategoryIndexCubit() : super(ChangeCategoryIndexInitial());

  int selectIndex = 0;

  void changeCategoryIndex({required int index}) async {
    selectIndex = index;
    emit(ChangeCategoryIndexSuccess());
  }
}
