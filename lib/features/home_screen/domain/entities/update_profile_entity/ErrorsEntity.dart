/// msg : "E-mail already in use"

class ErrorsEntity {
  ErrorsEntity({
    String? msg,
  }) {
    _msg = msg;
  }

  String? _msg;

  String? get msg => _msg ?? "";
}
