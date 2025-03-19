import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartProductsEntity.dart';

import 'CartProductModel.dart';

/// count : 6
/// _id : "67ab3a60893a55077b1ff8ac"
/// product : {"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"}
/// price : 149

class CartProductsModel {
  CartProductsModel({
    num? count,
    String? id,
    CartProductModel? product,
    num? price,
  }) {
    _count = count;
    _id = id;
    _product = product;
    _price = price;
  }

  CartProductsModel.fromJson(dynamic json) {
    _count = json['count'];
    _id = json['_id'];
    _product =
        json['product'] != null ? CartProductModel.fromJson(json['product']) : null;
    _price = json['price'];
  }

  num? _count;
  String? _id;
  CartProductModel? _product;
  num? _price;

  num? get count => _count ?? 0;


  String? get id => _id ?? "";

  CartProductModel? get product => _product ?? CartProductModel();

  num? get price => _price ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['_id'] = _id;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['price'] = _price;
    return map;
  }

  CartProductsEntity toCartProductsEntity(){
    return CartProductsEntity(
      id: id,
      price: price,
      count: count,
      product: product?.toCartProductEntity(),
    );
  }
}
