import 'CartDataEntity.dart';

/// status : "success"
/// statusMsg : "fail"
/// message : "Invalid Token. please login again"
/// numOfCartItems : 1
/// cartId : "67ab3a60893a55077b1ff8ab"
/// data : {"products":[{"count":6,"_id":"67ab3a60893a55077b1ff8ac","product":{"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"},"price":149}],"totalCartPrice":894}

class CartResponseEntity {
  CartResponseEntity({
    String? status,
    String? statusMsg,
    String? message,
    num? numOfCartItems,
    String? cartId,
    CartDataEntity? data,
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
  CartDataEntity? _data;

  String? get status => _status ?? "";

  String? get statusMsg => _statusMsg ?? "";

  String? get message => _message ?? "";

  num? get numOfCartItems => _numOfCartItems ?? 0;

  String? get cartId => _cartId ?? '';

  CartDataEntity? get data => _data ?? CartDataEntity();

}
