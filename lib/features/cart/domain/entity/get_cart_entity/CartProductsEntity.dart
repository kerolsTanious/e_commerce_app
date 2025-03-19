import 'CartProductEntity.dart';

/// count : 6
/// _id : "67ab3a60893a55077b1ff8ac"
/// product : {"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"}
/// price : 149

class CartProductsEntity {
  CartProductsEntity({
    num? count,
    String? id,
    CartProductEntity? product,
    num? price,
  }) {
    _count = count;
    _id = id;
    _product = product;
    _price = price;
  }

  num? _count;
  String? _id;
  CartProductEntity? _product;
  num? _price;

  num? get count => _count ?? 0;

  String? get id => _id ?? "";

  CartProductEntity? get product => _product ?? CartProductEntity();

  num? get price => _price ?? 0;
}
