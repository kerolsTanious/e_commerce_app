import 'CartProductsEntity.dart';

/// products : [{"count":6,"_id":"67ab3a60893a55077b1ff8ac","product":{"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"},"price":149}]
/// totalCartPrice : 894

class CartDataEntity {
  CartDataEntity({
    List<CartProductsEntity>? products,
    num? totalCartPrice,
  }) {
    _products = products;
    _totalCartPrice = totalCartPrice;
  }


  List<CartProductsEntity>? _products;
  num? _totalCartPrice;

  List<CartProductsEntity>? get products => _products ?? [];

  num? get totalCartPrice => _totalCartPrice ?? 0;
}
