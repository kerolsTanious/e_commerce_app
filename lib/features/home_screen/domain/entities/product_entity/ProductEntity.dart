import 'package:e_commerce_app_route/features/home_screen/domain/entities/BrandEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app_route/features/home_screen/domain/entities/SubCategoryEntity.dart';


/// sold : 15470
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680403266805-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403266806-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403266806-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403266807-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428eb43dc1175abc65ca0b3"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 220
/// price : 149
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8

class ProductEntity {
  ProductEntity({
    num? sold,
    List<String>? images,
    List<SubCategoryEntity>? subcategory,
    num? ratingsQuantity,
    String? id,
    String? title,
    String? slug,
    String? description,
    num? quantity,
    num? price,
    num? priceAfterDiscount,
    String? imageCover,
    CategoryEntity? category,
    BrandEntity? brand,
    num? ratingsAverage,
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
    _category = category;
    _brand = brand;
    _ratingsAverage = ratingsAverage;
  }

  num? _sold;
  List<String>? _images;
  List<SubCategoryEntity>? _subcategory;
  num? _ratingsQuantity;
  String? _id;
  String? _title;
  String? _slug;
  String? _description;
  num? _quantity;
  num? _price;
  num? _priceAfterDiscount;
  String? _imageCover;
  CategoryEntity? _category;
  BrandEntity? _brand;
  num? _ratingsAverage;

  num? get sold => _sold ?? 0;

  List<String>? get images => _images ?? [];

  List<SubCategoryEntity>? get subcategory => _subcategory ?? [];

  num? get ratingsQuantity => _ratingsQuantity ?? 0;

  String? get id => _id ?? "";

  String? get title => _title ?? '';

  String? get slug => _slug ?? "";

  String? get description => _description ?? "";

  num? get quantity => _quantity ?? 0;

  num? get price => _price ?? 0;

  num? get priceAfterDiscount => _priceAfterDiscount ?? 0;

  String? get imageCover => _imageCover ?? "";

  CategoryEntity? get category => _category ?? CategoryEntity();

  BrandEntity? get brand => _brand ?? BrandEntity();

  num? get ratingsAverage => _ratingsAverage ?? 0;
}
