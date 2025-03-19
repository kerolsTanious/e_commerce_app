import 'package:e_commerce_app_route/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/get_cart/get_cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit({required this.getCartUseCase}) : super(GetCartInitial());
  final GetCartUseCase getCartUseCase;

  static GetCartCubit getCartCubit(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> fetchCartProducts({required String token}) async {
    emit(GetCartLoading());
    var result = await getCartUseCase.call(token: token);
    result.fold(
      (response) {
        emit(GetCartSuccess(cartResponseEntity: response));
      },
      (error) {
        emit(GetCartFailure(errorMessage: error));
      },
    );
  }
}
