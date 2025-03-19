/// name : "kerols"
/// email : "kerols414@gmail.com"
/// role : "user"

class UserEntityProfileUpdate {
  UserEntityProfileUpdate({
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
