import 'Metadata.dart';
import 'brands_model.dart';

/// results : 54
/// metadata : {"currentPage":1,"numberOfPages":6,"limit":10,"nextPage":2}
/// data : [{"_id":"64089fe824b25627a25315d1","name":"Canon","slug":"canon","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286824747.png","createdAt":"2023-03-08T14:47:04.912Z","updatedAt":"2023-03-08T14:47:04.912Z"},{"_id":"64089faf24b25627a25315cd","name":"Dell","slug":"dell","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286767914.png","createdAt":"2023-03-08T14:46:07.963Z","updatedAt":"2023-03-08T14:46:07.963Z"},{"_id":"64089f8b24b25627a25315ca","name":"Lenovo","slug":"lenovo","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286730980.png","createdAt":"2023-03-08T14:45:31.041Z","updatedAt":"2023-03-08T14:45:31.041Z"},{"_id":"64089f5824b25627a25315c7","name":"SONY","slug":"sony","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286680638.png","createdAt":"2023-03-08T14:44:40.740Z","updatedAt":"2023-03-08T14:44:40.740Z"},{"_id":"64089f1c24b25627a25315c3","name":"Infinix","slug":"infinix","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286620402.png","createdAt":"2023-03-08T14:43:40.601Z","updatedAt":"2023-03-08T14:43:40.601Z"},{"_id":"64089ef124b25627a25315c0","name":"Realme","slug":"realme","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286577463.png","createdAt":"2023-03-08T14:42:57.494Z","updatedAt":"2023-03-08T14:42:57.494Z"},{"_id":"64089ecb24b25627a25315bd","name":"HONOR","slug":"honor","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286539788.png","createdAt":"2023-03-08T14:42:19.819Z","updatedAt":"2023-03-08T14:42:19.819Z"},{"_id":"64089ea624b25627a25315ba","name":"Nokia","slug":"nokia","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286502288.png","createdAt":"2023-03-08T14:41:42.322Z","updatedAt":"2023-03-08T14:41:42.322Z"},{"_id":"64089e8124b25627a25315b7","name":"OPPO","slug":"oppo","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286465856.png","createdAt":"2023-03-08T14:41:05.891Z","updatedAt":"2023-03-08T14:41:05.891Z"},{"_id":"64089e5524b25627a25315b4","name":"Huawei","slug":"huawei","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286421517.png","createdAt":"2023-03-08T14:40:21.568Z","updatedAt":"2023-03-08T14:40:21.568Z"}]

class BrandsResponse {
  BrandsResponse({
    num? results,
    Metadata? metadata,
    List<BrandsModel>? data,
  }) {
    _results = results;
    _metadata = metadata;
    _data = data;
  }

  BrandsResponse.fromJson(dynamic json) {
    _results = json['results'];
    _metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BrandsModel.fromJson(v));
      });
    }
  }

  num? _results;
  Metadata? _metadata;
  List<BrandsModel>? _data;

  num? get results => _results ?? 0;

  Metadata? get metadata => _metadata ?? Metadata();

  List<BrandsModel>? get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = _results;
    if (_metadata != null) {
      map['metadata'] = _metadata?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
