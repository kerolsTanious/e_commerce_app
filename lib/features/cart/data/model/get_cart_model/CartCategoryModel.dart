/// _id : "6439d58a0049ad0b52b9003f"
/// name : "Women's Fashion"
/// slug : "women's-fashion"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"

class CartCategoryModel {
  CartCategoryModel({
    String? id,
    String? name,
    String? slug,
    String? image,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
  }

  CartCategoryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
  }

  String? _id;
  String? _name;
  String? _slug;
  String? _image;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get slug => _slug ?? "";

  String? get image => _image ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image'] = _image;
    return map;
  }
}
