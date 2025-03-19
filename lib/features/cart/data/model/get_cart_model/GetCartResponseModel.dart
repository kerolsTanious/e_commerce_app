import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';

import 'CartDataModel.dart';

/// status : "success"
/// statusMsg : "fail"
/// message : "Invalid Token. please login again"
/// numOfCartItems : 1
/// cartId : "67ab3a60893a55077b1ff8ab"
/// data : {"_id":"67ab3a60893a55077b1ff8ab","cartOwner":"674afbf7803e888e0563d778","products":[{"count":6,"_id":"67ab3a60893a55077b1ff8ac","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149}],"createdAt":"2025-02-11T11:54:08.579Z","updatedAt":"2025-02-11T17:56:48.360Z","__v":0,"totalCartPrice":894}

class GetCartResponseModel {
  GetCartResponseModel({
    String? status,
    String? statusMsg,
    String? message,
    num? numOfCartItems,
    String? cartId,
    CartDataModel? data,
  }) {
    _status = status;
    _statusMsg = statusMsg;
    _message = message;
    _numOfCartItems = numOfCartItems;
    _cartId = cartId;
    _data = data;
  }

  GetCartResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusMsg = json['statusMsg'];
    _message = json['message'];
    _numOfCartItems = json['numOfCartItems'];
    _cartId = json['cartId'];
    _data = json['data'] != null ? CartDataModel.fromJson(json['data']) : null;
  }

  String? _status;
  String? _statusMsg;
  String? _message;
  num? _numOfCartItems;
  String? _cartId;
  CartDataModel? _data;

  String? get status => _status ?? "";

  String? get statusMsg => _statusMsg ?? "";

  String? get message => _message ?? "";

  num? get numOfCartItems => _numOfCartItems ?? 0;

  String? get cartId => _cartId ?? "";

  CartDataModel? get data => _data ?? CartDataModel();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['statusMsg'] = _statusMsg;
    map['message'] = _message;
    map['numOfCartItems'] = _numOfCartItems;
    map['cartId'] = _cartId;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  CartResponseEntity toCartResponseEntity (){
    return CartResponseEntity(
      status: status,
      cartId: cartId,
      message: message,
      statusMsg: statusMsg,
      numOfCartItems: numOfCartItems,
      data: data?.toCartDataEntity(),
    );
  }
}
