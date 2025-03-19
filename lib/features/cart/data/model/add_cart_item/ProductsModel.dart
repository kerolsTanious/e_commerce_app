import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/Products.dart';

/// count : 3
/// _id : "67adb73e4a9040166a8f20d0"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class ProductsModel {
  ProductsModel({
    num? count,
    String? id,
    String? product,
    num? price,
  }) {
    _count = count;
    _id = id;
    _product = product;
    _price = price;
  }

  ProductsModel.fromJson(dynamic json) {
    _count = json['count'];
    _id = json['_id'];
    _product = json['product'];
    _price = json['price'];
  }

  num? _count;
  String? _id;
  String? _product;
  num? _price;

  num? get count => _count ?? 0;

  String? get id => _id ?? '';

  String? get product => _product ?? "";

  num? get price => _price ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['_id'] = _id;
    map['product'] = _product;
    map['price'] = _price;
    return map;
  }

  ProductsEntity toProductsEntity(){
    return ProductsEntity(
      product: product,
      id: id,
      price: price,
      count: count,
    );
  }
}
