import 'ErrorsEntity.dart';

/// message : "fail"
/// errors : {"msg":"E-mail already in use"}

class UpdateProfileResponseEntity {
  UpdateProfileResponseEntity({
    String? message,
    ErrorsEntity? errors,
  }) {
    _message = message;
    _errors = errors;
  }

  String? _message;
  ErrorsEntity? _errors;

  String? get message => _message ?? "";

  ErrorsEntity? get errors => _errors ?? ErrorsEntity();
}
