import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartDataEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartProductsEntity.dart';

import 'Products.dart';

/// cartOwner : "674afbf7803e888e0563d778"
/// products : [{"count":2,"_id":"67a5299e518151d803daece4","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":46,"_id":"67a529a1518151d803daecfa","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// totalCartPrice : 7152

class AddProductItemDataEntity {
  AddProductItemDataEntity({
    String? cartOwner,
    List<ProductsEntity>? products,
    num? totalCartPrice,
  }) {
    _cartOwner = cartOwner;
    _products = products;
    _totalCartPrice = totalCartPrice;
  }

  String? _cartOwner;
  List<ProductsEntity>? _products;
  num? _totalCartPrice;

  String? get cartOwner => _cartOwner ?? "";

  List<ProductsEntity>? get products => _products ?? [];

  num? get totalCartPrice => _totalCartPrice ?? 0;

  CartDataEntity toCartDataEntity() {
    List<CartProductsEntity> cartProductEntityList = [];
    for (ProductsEntity productsEntity in products ?? []) {
      cartProductEntityList.add(productsEntity.toCartProductEntityList());
    }
    return CartDataEntity(
      totalCartPrice: totalCartPrice,
      products: cartProductEntityList,
    );
  }
}
