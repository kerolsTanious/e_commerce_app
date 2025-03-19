/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

class Metadata {
  Metadata({
      num? currentPage, 
      num? numberOfPages, 
      num? limit,}){
    _currentPage = currentPage;
    _numberOfPages = numberOfPages;
    _limit = limit;
}

  Metadata.fromJson(dynamic json) {
    _currentPage = json['currentPage'];
    _numberOfPages = json['numberOfPages'];
    _limit = json['limit'];
  }
  num? _currentPage;
  num? _numberOfPages;
  num? _limit;

  num? get currentPage => _currentPage;
  num? get numberOfPages => _numberOfPages;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = _currentPage;
    map['numberOfPages'] = _numberOfPages;
    map['limit'] = _limit;
    return map;
  }

}