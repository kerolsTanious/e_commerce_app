/// value : "kerols414@gmail.com"
/// msg : "E-mail already in use"
/// param : "email"
/// location : "body"

class ErrorsModel {
  ErrorsModel({
    String? value,
    String? msg,
    String? param,
    String? location,
  }) {
    _value = value;
    _msg = msg;
    _param = param;
    _location = location;
  }

  ErrorsModel.fromJson(dynamic json) {
    _value = json['value'];
    _msg = json['msg'];
    _param = json['param'];
    _location = json['location'];
  }

  String? _value;
  String? _msg;
  String? _param;
  String? _location;

  String? get value => _value ?? "";

  String? get msg => _msg ?? "";

  String? get param => _param ?? "";

  String? get location => _location ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['msg'] = _msg;
    map['param'] = _param;
    map['location'] = _location;
    return map;
  }
}
