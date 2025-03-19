import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';

sealed class GetCartState {}

final class GetCartInitial extends GetCartState {}

final class GetCartLoading extends GetCartState {}

final class GetCartSuccess extends GetCartState {
  final CartResponseEntity cartResponseEntity;

  GetCartSuccess({required this.cartResponseEntity});
}

final class GetCartFailure extends GetCartState {
  final String errorMessage;

  GetCartFailure({required this.errorMessage});
}
