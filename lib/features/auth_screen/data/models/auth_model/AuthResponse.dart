import 'package:e_commerce_app_route/features/auth_screen/domain/entities/auth_entity/AuthResponseEntity.dart';

import 'UserModel.dart';

/// statusMsg : "fail"
/// message : "success"
/// user : {"name":"tito","email":"tito44@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTM1NGM3NTE4MTUxZDgwM2MyYWQxMyIsIm5hbWUiOiJ0aXRvIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3Mzg3NTczMjAsImV4cCI6MTc0NjUzMzMyMH0.P6jxPIwWe-AuMihA2NjXxB10agQAcBAIUsa2UJSBJL4"

class AuthResponse {
  AuthResponse({
    String? statusMsg,
    String? message,
    UserModel? user,
    String? token,
  }) {
    _statusMsg = statusMsg;
    _message = message;
    _user = user;
    _token = token;
  }

  AuthResponse.fromJson(dynamic json) {
    _statusMsg = json['statusMsg'];
    _message = json['message'];
    _user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    _token = json['token'];
  }

  String? _statusMsg;
  String? _message;
  UserModel? _user;
  String? _token;

  String? get statusMsg => _statusMsg ?? "";

  String? get message => _message ?? "";

  UserModel? get user => _user ?? UserModel();

  String? get token => _token ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = _statusMsg;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    return map;
  }

  AuthResponseEntity toAuthResponseEntity() {
    return AuthResponseEntity(
      message: message,
      statusMsg: statusMsg,
      token: token,
      user: user?.toUserEntity(),
    );
  }
}
