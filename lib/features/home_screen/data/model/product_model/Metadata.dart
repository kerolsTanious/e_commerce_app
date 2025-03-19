/// currentPage : 1
/// numberOfPages : 2
/// limit : 40
/// nextPage : 2

class Metadata {
  Metadata({
    num? currentPage,
    num? numberOfPages,
    num? limit,
    num? nextPage,
  }) {
    _currentPage = currentPage;
    _numberOfPages = numberOfPages;
    _limit = limit;
    _nextPage = nextPage;
  }

  Metadata.fromJson(dynamic json) {
    _currentPage = json['currentPage'];
    _numberOfPages = json['numberOfPages'];
    _limit = json['limit'];
    _nextPage = json['nextPage'];
  }

  num? _currentPage;
  num? _numberOfPages;
  num? _limit;
  num? _nextPage;

  num? get currentPage => _currentPage ?? 0;

  num? get numberOfPages => _numberOfPages ?? 0;

  num? get limit => _limit ?? 0;

  num? get nextPage => _nextPage ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = _currentPage;
    map['numberOfPages'] = _numberOfPages;
    map['limit'] = _limit;
    map['nextPage'] = _nextPage;
    return map;
  }
}
