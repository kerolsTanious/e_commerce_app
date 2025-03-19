import 'UserEntity.dart';

/// message : "success"
/// user : {"name":"kerols","email":"kerols414@gmail.com","role":"user"}

class UpdateProfileResponseEntity {
  UpdateProfileResponseEntity({
    String? message,
    UserEntityProfileUpdate? user,
  }) {
    _message = message;
    _user = user;
  }

  String? _message;
  UserEntityProfileUpdate? _user;

  String? get message => _message ?? "";

  UserEntityProfileUpdate? get user => _user ?? UserEntityProfileUpdate();
}
