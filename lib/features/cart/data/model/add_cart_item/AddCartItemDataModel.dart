import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/AddProductDataEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/Products.dart';

import 'ProductsModel.dart';

/// _id : "67adb73e4a9040166a8f20cf"
/// cartOwner : "67adb6bd4a9040166a8f1624"
/// products : [{"count":3,"_id":"67adb73e4a9040166a8f20d0","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2025-02-13T09:11:26.728Z"
/// updatedAt : "2025-02-17T01:12:26.727Z"
/// __v : 0
/// totalCartPrice : 447

class AddCartItemDataModel {
  AddCartItemDataModel({
    String? id,
    String? cartOwner,
    List<ProductsModel>? products,
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

  AddCartItemDataModel.fromJson(dynamic json) {
    _id = json['_id'];
    _cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductsModel.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _totalCartPrice = json['totalCartPrice'];
  }

  String? _id;
  String? _cartOwner;
  List<ProductsModel>? _products;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  num? _totalCartPrice;

  String? get id => _id ?? "";

  String? get cartOwner => _cartOwner ?? "";

  List<ProductsModel>? get products => _products ?? [];

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

  AddProductItemDataEntity toAddProductItemDataEntity() {
    List<ProductsEntity> productsListEntity = [];
    for (ProductsModel productsModel in products ?? []) {
      productsListEntity.add(productsModel.toProductsEntity());
    }
    return AddProductItemDataEntity(
      cartOwner: cartOwner,
      totalCartPrice: totalCartPrice,
      products: productsListEntity,
    );
  }
}
