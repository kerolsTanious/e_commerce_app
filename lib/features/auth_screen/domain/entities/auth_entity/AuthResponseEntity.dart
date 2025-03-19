import 'UserEntity.dart';

/// statusMsg : "fail"
/// message : "success"
/// user : {"name":"tito","email":"tito44@gmail.com"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTM1NGM3NTE4MTUxZDgwM2MyYWQxMyIsIm5hbWUiOiJ0aXRvIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3Mzg3NTczMjAsImV4cCI6MTc0NjUzMzMyMH0.P6jxPIwWe-AuMihA2NjXxB10agQAcBAIUsa2UJSBJL4"

class AuthResponseEntity {
  AuthResponseEntity({
    String? statusMsg,
    String? message,
    UserEntity? user,
    String? token,
  }) {
    _statusMsg = statusMsg;
    _message = message;
    _user = user;
    _token = token;
  }

  String? _statusMsg;
  String? _message;
  UserEntity? _user;
  String? _token;

  String? get statusMsg => _statusMsg ?? "";

  String? get message => _message ?? "";

  UserEntity? get user => _user ?? UserEntity();

  String? get token => _token ?? "";
}
