import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartProductEntity.dart';

import 'CartBrandModel.dart';
import 'CartCategoryModel.dart';
import 'CartSubcategoryModel.dart';

/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// _id : "6428eb43dc1175abc65ca0b3"
/// title : "Woman Shawl"
/// quantity : 220
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// id : "6428eb43dc1175abc65ca0b3"

class CartProductModel {
  CartProductModel({
    List<CartSubcategoryModel>? subcategory,
    String? id,
    String? title,
    num? quantity,
    String? imageCover,
    CartCategoryModel? category,
    CartBrandModel? brand,
    num? ratingsAverage,
  }) {
    _subcategory = subcategory;
    _id = id;
    _title = title;
    _quantity = quantity;
    _imageCover = imageCover;
    _category = category;
    _brand = brand;
    _ratingsAverage = ratingsAverage;
  }

  CartProductModel.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      _subcategory = [];
      json['subcategory'].forEach((v) {
        _subcategory?.add(CartSubcategoryModel.fromJson(v));
      });
    }
    _id = json['_id'];
    _title = json['title'];
    _quantity = json['quantity'];
    _imageCover = json['imageCover'];
    _category =
        json['category'] != null ? CartCategoryModel.fromJson(json['category']) : null;
    _brand = json['brand'] != null ? CartBrandModel.fromJson(json['brand']) : null;
    _ratingsAverage = json['ratingsAverage'];
  }

  List<CartSubcategoryModel>? _subcategory;
  String? _id;
  String? _title;
  num? _quantity;
  String? _imageCover;
  CartCategoryModel? _category;
  CartBrandModel? _brand;
  num? _ratingsAverage;

  List<CartSubcategoryModel>? get subcategory => _subcategory ?? [];

  String? get id => _id ?? '';

  String? get title => _title ?? "";

  num? get quantity => _quantity ?? 0;

  String? get imageCover => _imageCover ?? "";

  CartCategoryModel? get category => _category ??CartCategoryModel();

  CartBrandModel? get brand => _brand ?? CartBrandModel();

  num? get ratingsAverage => _ratingsAverage ?? 0;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = _id;
    map['title'] = _title;
    map['quantity'] = _quantity;
    map['imageCover'] = _imageCover;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    map['ratingsAverage'] = _ratingsAverage;
    return map;
  }

  CartProductEntity toCartProductEntity(){
    return CartProductEntity(
      id: id,
      imageCover: imageCover,
      quantity: quantity,
      title: title,
    );
  }
}
