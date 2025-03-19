import 'package:e_commerce_app_route/features/home_screen/domain/entities/BrandEntity.dart';

/// _id : "64089fe824b25627a25315d1"
/// name : "Canon"
/// slug : "canon"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png"
/// createdAt : "2023-03-08T14:47:04.912Z"
/// updatedAt : "2023-03-08T14:47:04.912Z"

class BrandsModel {
  BrandsModel({
    String? id,
    String? name,
    String? slug,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  BrandsModel.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  String? _id;
  String? _name;
  String? _slug;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get slug => _slug ?? "";

  String? get image => _image ?? "";

  String? get createdAt => _createdAt ?? "";

  String? get updatedAt => _updatedAt ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image'] = _image;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

  BrandEntity toBrandEntity() {
    return BrandEntity(
      image: image,
      name: name,
      id: id,
    );
  }
}
