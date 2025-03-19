import 'package:e_commerce_app_route/features/home_screen/domain/entities/update_profile_entity/UpadateProfileResponseEntity.dart';

import 'UserModel.dart';

/// message : "success"
/// user : {"name":"kerols","email":"kerols414@gmail.com","role":"user"}

class UpdateProfileResponseModel {
  UpdateProfileResponseModel({
    String? message,
    UserModel? user,
  }) {
    _message = message;
    _user = user;
  }

  UpdateProfileResponseModel.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  String? _message;
  UserModel? _user;

  String? get message => _message ?? "";

  UserModel? get user => _user ?? UserModel();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

  UpdateProfileResponseEntity toUpdateProfileResponseEntity(){
    return UpdateProfileResponseEntity(
      message: message,
      user: user?.toUserEntity()
    );
  }
}
