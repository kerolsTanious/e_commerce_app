import 'package:e_commerce_app_route/features/home_screen/domain/entities/update_profile_entity/UserEntity.dart';

/// name : "kerols"
/// email : "kerols414@gmail.com"
/// role : "user"

class UserModel {
  UserModel({
    String? name,
    String? email,
    String? role,
  }) {
    _name = name;
    _email = email;
    _role = role;
  }

  UserModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _role = json['role'];
  }

  String? _name;
  String? _email;
  String? _role;

  String? get name => _name ?? "";

  String? get email => _email ?? "";

  String? get role => _role ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['role'] = _role;
    return map;
  }

  UserEntityProfileUpdate toUserEntity() {
    return UserEntityProfileUpdate(
      name: name,
      email: email,
    );
  }
}
