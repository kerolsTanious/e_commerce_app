import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartProductsEntity.dart';

/// count : 2
/// _id : "67a5299e518151d803daece4"
/// product : "6428ead5dc1175abc65ca0ad"
/// price : 149

class ProductsEntity {
  ProductsEntity({
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

  num? _count;
  String? _id;
  String? _product;
  num? _price;

  num? get count => _count ?? 0;

  String? get id => _id ?? "";

  String? get product => _product ?? "";

  num? get price => _price ?? 0;

  CartProductsEntity toCartProductEntityList(){
    return CartProductsEntity(
      count: count,
      price: price,
      id: id,
    );
  }
}
