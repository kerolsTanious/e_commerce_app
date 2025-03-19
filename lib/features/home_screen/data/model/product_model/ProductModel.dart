import 'package:e_commerce_app_route/features/home_screen/data/model/brands_model/brands_model.dart';
import 'package:e_commerce_app_route/features/home_screen/data/model/category_model/category_model.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/product_entity/ProductEntity.dart';

import 'SubcategoryModel.dart';

/// sold : 8802
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397483-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397485-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 225
/// price : 190
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:43:18.400Z"
/// updatedAt : "2024-12-12T01:25:53.194Z"
/// id : "6428ebc6dc1175abc65ca0b9"

class ProductModel {
  ProductModel({
    num? sold,
    List<String>? images,
    List<SubcategoryModel>? subcategory,
    num? ratingsQuantity,
    String? id,
    String? title,
    String? slug,
    String? description,
    num? quantity,
    num? price,
    num? priceAfterDiscount,
    String? imageCover,
    List<String>? availableColors,
    CategoryModel? category,
    BrandsModel? brand,
    num? ratingsAverage,
    String? createdAt,
    String? updatedAt,
  }) {
    _sold = sold;
    _images = images;
    _subcategory = subcategory;
    _ratingsQuantity = ratingsQuantity;
    _id = id;
    _title = title;
    _slug = slug;
    _description = description;
    _quantity = quantity;
    _price = price;
    _priceAfterDiscount = priceAfterDiscount;
    _imageCover = imageCover;
    _availableColors = availableColors;
    _category = category;
    _brand = brand;
    _ratingsAverage = ratingsAverage;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ProductModel.fromJson(dynamic json) {
    _sold = json['sold'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _availableColors = json['availableColors'] != null
        ? json['availableColors'].cast<String>()
        : [];
    if (json['subcategory'] != null) {
      _subcategory = [];
      json['subcategory'].forEach((v) {
        _subcategory?.add(SubcategoryModel.fromJson(v));
      });
    }
    _ratingsQuantity = json['ratingsQuantity'];
    _id = json['_id'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _quantity = json['quantity'];
    _price = json['price'];
    _priceAfterDiscount = json["priceAfterDiscount"];
    _imageCover = json['imageCover'];
    _category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    _brand = json['brand'] != null ? BrandsModel.fromJson(json['brand']) : null;
    _ratingsAverage = json['ratingsAverage'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  num? _sold;
  List<String>? _images;
  List<SubcategoryModel>? _subcategory;
  num? _ratingsQuantity;
  String? _id;
  String? _title;
  String? _slug;
  String? _description;
  num? _quantity;
  num? _price;
  num? _priceAfterDiscount;
  String? _imageCover;
  List<String>? _availableColors;
  CategoryModel? _category;
  BrandsModel? _brand;
  num? _ratingsAverage;
  String? _createdAt;
  String? _updatedAt;

  num? get sold => _sold ?? 0;

  List<String>? get images => _images ?? [];

  List<String>? get availableColors => _availableColors ?? [];

  List<SubcategoryModel>? get subcategory => _subcategory ?? [];

  num? get ratingsQuantity => _ratingsQuantity ?? 0;

  String? get id => _id ?? '';

  String? get title => _title ?? "";

  String? get slug => _slug ?? "";

  String? get description => _description ?? "";

  num? get quantity => _quantity ?? 0;

  num? get price => _price ?? 0;

  num? get priceAfterDiscount => _priceAfterDiscount ?? 0;

  String? get imageCover => _imageCover ?? '';

  CategoryModel? get category => _category ?? CategoryModel();

  BrandsModel? get brand => _brand ?? BrandsModel();

  num? get ratingsAverage => _ratingsAverage ?? 0;

  String? get createdAt => _createdAt ?? "";

  String? get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = _sold;
    map['images'] = _images;
    map['availableColors'] = _availableColors;
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = _ratingsQuantity;
    map['_id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map["priceAfterDiscount"] = _priceAfterDiscount;
    map['imageCover'] = _imageCover;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    map['ratingsAverage'] = _ratingsAverage;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

  ProductEntity toProductEntity() {
    return ProductEntity(
      id: id,
      slug: slug,
      title: title,
      sold: sold,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      images: images,
      description: description,
      ratingsQuantity: ratingsQuantity,
      ratingsAverage: ratingsAverage,
      imageCover: imageCover,
      category: category?.toCategoryEntity(),
      brand: brand?.toBrandEntity(),
      subcategory: subcategory
          ?.map((subcategoryModel) => subcategoryModel.toSubcategoryEntity())
          .toList(),
    );
  }
}
