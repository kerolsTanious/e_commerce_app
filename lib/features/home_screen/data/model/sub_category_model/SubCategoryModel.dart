import 'package:e_commerce_app_route/features/home_screen/domain/entities/SubCategoryEntity.dart';

/// _id : "6407f276b575d3b90bf957b8"
/// name : "Bags & luggage"
/// slug : "bags-and-luggage"
/// category : "6439d5b90049ad0b52b90048"
/// createdAt : "2023-03-08T02:27:02.780Z"
/// updatedAt : "2023-04-14T23:10:29.386Z"

class SubCategoryModel {
  SubCategoryModel({
    String? id,
    String? name,
    String? slug,
    String? category,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _category = category;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  SubCategoryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _category = json['category'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  String? _id;
  String? _name;
  String? _slug;
  String? _category;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;

  String? get name => _name;

  String? get slug => _slug;

  String? get category => _category;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['category'] = _category;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

  SubCategoryEntity toSubCategoryEntity() {
    return SubCategoryEntity(
      name: name,
      id: id,
      slug: slug,
      category: category,
    );
  }
}
