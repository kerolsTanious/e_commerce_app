/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"

class CategoryEntity {
  CategoryEntity({
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

  String? _id;
  String? _name;
  String? _slug;
  String? _image;

  String? get id => _id ?? "";

  String? get name => _name ?? '';

  String? get slug => _slug ?? '';

  String? get image => _image ?? '';

}
