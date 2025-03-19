import 'ErrorsModel.dart';

/// message : "fail"
/// errors : {"value":"kerols414@gmail.com","msg":"E-mail already in use","param":"email","location":"body"}

class UpdateProfileResponseErrorModel {
  UpdateProfileResponseErrorModel({
    String? message,
    ErrorsModel? errors,
  }) {
    _message = message;
    _errors = errors;
  }

  UpdateProfileResponseErrorModel.fromJson(dynamic json) {
    _message = json['message'];
    _errors = json['errors'] != null ? ErrorsModel.fromJson(json['errors']) : null;
  }

  String? _message;
  ErrorsModel? _errors;

  String? get message => _message ?? "";

  ErrorsModel? get errors => _errors ?? ErrorsModel();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }
}
