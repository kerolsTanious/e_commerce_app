import 'package:e_commerce_app_route/features/home_screen/domain/entities/SubCategoryEntity.dart';

/// _id : "6407f1bcb575d3b90bf95797"
/// name : "Women's Clothing"
/// slug : "women's-clothing"
/// category : "6439d58a0049ad0b52b9003f"

class SubcategoryModel {
  SubcategoryModel({
    String? id,
    String? name,
    String? slug,
    String? category,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _category = category;
  }

  SubcategoryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _category = json['category'];
  }

  String? _id;
  String? _name;
  String? _slug;
  String? _category;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get slug => _slug ?? "";

  String? get category => _category ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['category'] = _category;
    return map;
  }

  SubCategoryEntity toSubcategoryEntity(){
    return SubCategoryEntity(
      category: category,
      slug: slug,
      id: id,
      name: name,
    );
  }
}
