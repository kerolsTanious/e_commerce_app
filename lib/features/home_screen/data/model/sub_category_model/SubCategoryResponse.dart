import 'Metadata.dart';
import 'SubCategoryModel.dart';

/// results : 2
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// data : [{"_id":"6407f276b575d3b90bf957b8","name":"Bags & luggage","slug":"bags-and-luggage","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:27:02.780Z","updatedAt":"2023-04-14T23:10:29.386Z"},{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:26:11.097Z","updatedAt":"2023-04-14T23:10:29.386Z"}]

class SubCategoryResponse {
  SubCategoryResponse({
      num? results, 
      Metadata? metadata, 
      List<SubCategoryModel>? data,}){
    _results = results;
    _metadata = metadata;
    _data = data;
}

  SubCategoryResponse.fromJson(dynamic json) {
    _results = json['results'];
    _metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SubCategoryModel.fromJson(v));
      });
    }
  }
  num? _results;
  Metadata? _metadata;
  List<SubCategoryModel>? _data;

  num? get results => _results;
  Metadata? get metadata => _metadata;
  List<SubCategoryModel>? get data => _data;

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