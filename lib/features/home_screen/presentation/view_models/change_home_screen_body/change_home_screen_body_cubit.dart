import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/change_home_screen_body/change_home_screen_body_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeHomeScreenBodyCubit extends Cubit<ChangeHomeScreenBodyState> {
  ChangeHomeScreenBodyCubit() : super(ChangeHomeScreenBodyInitial());
  int currentIndex = 0;

  static ChangeHomeScreenBodyCubit changeHomeScreenBodyCubit(
      BuildContext context) {
    return BlocProvider.of(context);
  }

  void changeHomeScreenBody({required int newIndex}) {
    currentIndex = newIndex;
    emit(ChangeHomeScreenBodySuccess(newIndex: newIndex));
  }
}
