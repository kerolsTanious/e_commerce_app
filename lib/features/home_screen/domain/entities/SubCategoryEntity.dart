/// _id : "6407f276b575d3b90bf957b8"
/// name : "Bags & luggage"
/// slug : "bags-and-luggage"
/// category : "6439d5b90049ad0b52b90048"

class SubCategoryEntity {
  SubCategoryEntity({
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

  String? _id;
  String? _name;
  String? _slug;
  String? _category;

  String? get id => _id ?? "";

  String? get name => _name ?? "";

  String? get slug => _slug ?? "";

  String? get category => _category ?? "";

}
