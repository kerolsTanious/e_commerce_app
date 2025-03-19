import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/AddProductItemResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';

abstract class UpdateCartState {}

final class UpdateCartInitial extends UpdateCartState {}

final class UpdateCartSuccess extends UpdateCartState {
  final CartResponseEntity cartResponseEntity;

  UpdateCartSuccess({required this.cartResponseEntity});
}

final class UpdateCartFailure extends UpdateCartState {
  final String error;

  UpdateCartFailure({required this.error});
}

final class UpdateCartLoading extends UpdateCartState {}

final class DeleteCartItemLoading extends UpdateCartState {}

final class DeleteCartItemSuccess extends UpdateCartState {
  final CartResponseEntity cartResponseEntity;

  DeleteCartItemSuccess({required this.cartResponseEntity});
}

final class DeleteCartItemFailure extends UpdateCartState {
  final String errorMessage;

  DeleteCartItemFailure({required this.errorMessage});
}

final class AddCartItemSuccess extends UpdateCartState {
  final AddProductItemResponseEntity addProductItemResponseEntity;
  final String productId;

  AddCartItemSuccess({required this.addProductItemResponseEntity, required this.productId});

}

final class AddCartItemFailure extends UpdateCartState {
  final String errorMessage;
  final String productId;

  AddCartItemFailure({required this.productId, required this.errorMessage});
}

final class AddCartItemLoading extends UpdateCartState {
  final String productId;

  AddCartItemLoading({required this.productId});
}
