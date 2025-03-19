import 'package:e_commerce_app_route/features/home_screen/presentation/view_models/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());

  int currentIndex = 0;

  void changeBottomNavigationState({required int newIndex}) {
    currentIndex = newIndex;
    emit(BottomNavigationChangeState());
  }
}
