/// _id : "64089fe824b25627a25315d1"
/// name : "Canon"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png"

class BrandEntity {
  BrandEntity({
    String? id,
    String? name,
    String? image,
  }) {
    _id = id;
    _name = name;
    _image = image;
  }

  String? _id;
  String? _name;
  String? _image;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get image => _image ?? "";
}
