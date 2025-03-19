import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';

import 'AddProductDataEntity.dart';

/// status : "success"
/// statusMsg : "fail"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 2
/// cartId : "679a9a2630479eb1f82b9afb"
/// data : {"cartOwner":"674afbf7803e888e0563d778","products":[{"count":2,"_id":"67a5299e518151d803daece4","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":46,"_id":"67a529a1518151d803daecfa","product":"6428eb43dc1175abc65ca0b3","price":149}],"totalCartPrice":7152}

class AddProductItemResponseEntity {
  AddProductItemResponseEntity({
    String? status,
    String? statusMsg,
    String? message,
    num? numOfCartItems,
    String? cartId,
    AddProductItemDataEntity? data,
  }) {
    _status = status;
    _statusMsg = statusMsg;
    _message = message;
    _numOfCartItems = numOfCartItems;
    _cartId = cartId;
    _data = data;
  }

  String? _status;
  String? _statusMsg;
  String? _message;
  num? _numOfCartItems;
  String? _cartId;
  AddProductItemDataEntity? _data;

  String? get status => _status ?? "";

  String? get statusMsg => _statusMsg ?? "";

  String? get message => _message ?? "";

  num? get numOfCartItems => _numOfCartItems ?? 0;

  String? get cartId => _cartId ?? "";

  AddProductItemDataEntity? get data => _data ?? AddProductItemDataEntity();

  CartResponseEntity toCartResponseEntity(){
    return CartResponseEntity(
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      message: message,
      status: status,
      statusMsg: statusMsg,
      data: data?.toCartDataEntity(),
    );
  }
}
