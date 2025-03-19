import 'package:e_commerce_app_route/features/cart/domain/use_case/add_cart_use_ase.dart';
import 'package:e_commerce_app_route/features/cart/domain/use_case/delete_cart_use_case.dart';
import 'package:e_commerce_app_route/features/cart/domain/use_case/update_cart_use_case.dart';
import 'package:e_commerce_app_route/features/cart/presentation/view_model/update_cart/update_cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit({
    required this.addCartUseCase,
    required this.deleteCartItemUseCase,
    required this.updateCartUseCase,
  }) : super(UpdateCartInitial());
  final UpdateCartUseCase updateCartUseCase;
  final DeleteCartItemUseCase deleteCartItemUseCase;
  final AddCartUseCase addCartUseCase;

  static UpdateCartCubit updateCartCubit(BuildContext context) {
    return BlocProvider.of(context);
  }

  void addItem({
    required num currentCount,
    required String productId,
    required String token,
  }) {
    num newCount = currentCount + 1;
    updateCartItems(count: newCount, productId: productId, token: token);
  }

  void removeItem({
    required num currentCount,
    required String productId,
    required String token,
  }) {
    if (currentCount > 1) {
      num newCount = currentCount - 1;
      updateCartItems(count: newCount, productId: productId, token: token);
    }
  }

  Future<void> updateCartItems({
    required num count,
    required String productId,
    required String token,
  }) async {
    emit(UpdateCartLoading());
    var result = await updateCartUseCase.call(
      count: count,
      productId: productId,
      token: token,
    );
    result.fold(
      (response) {
        emit(UpdateCartSuccess(cartResponseEntity: response));
      },
      (error) {
        emit(UpdateCartFailure(error: error));
      },
    );
  }

  Future<void> deleteCartItem({
    required String token,
    required String productId,
  }) async {
    emit(DeleteCartItemLoading());
    var result = await deleteCartItemUseCase.call(
      token: token,
      productId: productId,
    );
    result.fold(
      (response) {
        emit(DeleteCartItemSuccess(cartResponseEntity: response));
      },
      (error) {
        emit(DeleteCartItemFailure(errorMessage: error));
      },
    );
  }

  Future<void> addCartItem({
    required String token,
    required String productId,
  }) async {
    emit(AddCartItemLoading(productId: productId));
    var result = await addCartUseCase.call(
      token: token,
      productId: productId,
    );
    result.fold(
      (response) {
        emit(
          AddCartItemSuccess(
            addProductItemResponseEntity: response,
            productId: productId,
          ),
        );
      },
      (error) {
        emit(
          AddCartItemFailure(
            errorMessage: error,
            productId: productId,
          ),
        );
      },
    );
  }
}
