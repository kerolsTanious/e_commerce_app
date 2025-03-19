import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/AddProductItemResponseEntity.dart';

import 'AddCartItemDataModel.dart';

/// status : "success"
/// statusMsg : "fail"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "67adb73e4a9040166a8f20cf"
/// data : {"_id":"67adb73e4a9040166a8f20cf","cartOwner":"67adb6bd4a9040166a8f1624","products":[{"count":3,"_id":"67adb73e4a9040166a8f20d0","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2025-02-13T09:11:26.728Z","updatedAt":"2025-02-17T01:12:26.727Z","__v":0,"totalCartPrice":447}

class AddCartItemResponseModel {
  AddCartItemResponseModel({
    String? status,
    String? statusMsg,
    String? message,
    num? numOfCartItems,
    String? cartId,
    AddCartItemDataModel? data,
  }) {
    _status = status;
    _statusMsg = statusMsg;
    _message = message;
    _numOfCartItems = numOfCartItems;
    _cartId = cartId;
    _data = data;
  }

  AddCartItemResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _statusMsg = json['statusMsg'];
    _message = json['message'];
    _numOfCartItems = json['numOfCartItems'];
    _cartId = json['cartId'];
    _data = json['data'] != null
        ? AddCartItemDataModel.fromJson(json['data'])
        : null;
  }

  String? _status;
  String? _statusMsg;
  String? _message;
  num? _numOfCartItems;
  String? _cartId;
  AddCartItemDataModel? _data;

  String? get status => _status ?? "";

  String? get statusMsg => _statusMsg ?? "";

  String? get message => _message ?? "";

  num? get numOfCartItems => _numOfCartItems ?? 0;

  String? get cartId => _cartId ?? "";

  AddCartItemDataModel? get data => _data ?? AddCartItemDataModel();

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

  AddProductItemResponseEntity toAddProductItemResponseEntity() {
    return AddProductItemResponseEntity(
      statusMsg: statusMsg,
      status: status,
      message: message,
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      data: data?.toAddProductItemDataEntity(),
    );
  }
}
