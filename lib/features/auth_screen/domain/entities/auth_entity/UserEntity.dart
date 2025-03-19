/// name : "tito"
/// email : "tito44@gmail.com"

class UserEntity {
  UserEntity({
    String? name,
    String? email,
  }) {
    _name = name;
    _email = email;
  }

  String? _name;
  String? _email;

  String? get name => _name ?? "";

  String? get email => _email ?? "";
}
