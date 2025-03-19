import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartDataEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartProductsEntity.dart';

import 'CartProductsModel.dart';

/// _id : "67ab3a60893a55077b1ff8ab"
/// cartOwner : "674afbf7803e888e0563d778"
/// products : [{"count":6,"_id":"67ab3a60893a55077b1ff8ac","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149}]
/// createdAt : "2025-02-11T11:54:08.579Z"
/// updatedAt : "2025-02-11T17:56:48.360Z"
/// __v : 0
/// totalCartPrice : 894

class CartDataModel {
  CartDataModel({
    String? id,
    String? cartOwner,
    List<CartProductsModel>? products,
    String? createdAt,
    String? updatedAt,
    num? v,
    num? totalCartPrice,
  }) {
    _id = id;
    _cartOwner = cartOwner;
    _products = products;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _totalCartPrice = totalCartPrice;
  }

  CartDataModel.fromJson(dynamic json) {
    _id = json['_id'];
    _cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(CartProductsModel.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _totalCartPrice = json['totalCartPrice'];
  }

  String? _id;
  String? _cartOwner;
  List<CartProductsModel>? _products;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  num? _totalCartPrice;

  String? get id => _id ?? "";

  String? get cartOwner => _cartOwner ?? "";

  List<CartProductsModel>? get products => _products ?? [];

  String? get createdAt => _createdAt ?? "";

  String? get updatedAt => _updatedAt ?? "";

  num? get v => _v ?? 0;

  num? get totalCartPrice => _totalCartPrice ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['cartOwner'] = _cartOwner;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['totalCartPrice'] = _totalCartPrice;
    return map;
  }


  CartDataEntity toCartDataEntity (){
    List<CartProductsEntity> cartProductsEntity = [];

    for(CartProductsModel product in products ?? []){
      cartProductsEntity.add(product.toCartProductsEntity());
    }
    return CartDataEntity(
      totalCartPrice: totalCartPrice,
      products: cartProductsEntity,
    );
  }
}
