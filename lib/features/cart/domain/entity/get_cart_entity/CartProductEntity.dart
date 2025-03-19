/// _id : "6428eb43dc1175abc65ca0b3"
/// title : "Woman Shawl"
/// quantity : 220
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"

class CartProductEntity {
  CartProductEntity({
    String? id,
    String? title,
    num? quantity,
    String? imageCover,
  }) {
    _id = id;
    _title = title;
    _quantity = quantity;
    _imageCover = imageCover;
  }

  String? _id;
  String? _title;
  num? _quantity;
  String? _imageCover;

  String? get id => _id ?? "";

  String? get title => _title ?? "";

  num? get quantity => _quantity ?? 0;

  String? get imageCover => _imageCover ?? '';
}
