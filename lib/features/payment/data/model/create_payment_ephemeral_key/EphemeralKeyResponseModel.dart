import 'AssociatedObjects.dart';

/// id : "ephkey_1R2iaODwUpql7AnyKQPix13A"
/// object : "ephemeral_key"
/// associated_objects : [{"id":"cus_RwWWFlmCYdscM6","type":"customer"}]
/// created : 1741998500
/// expires : 1742002100
/// livemode : false
/// secret : "ek_test_YWNjdF8xUjFxT2REd1VwcWw3QW55LHNyOWlSOFEwWE1nV0UyMzZ4R1lsaGNhM0VwNzdPNzA_00jheZqMXS"

class EphemeralKeyResponseModel {
  EphemeralKeyResponseModel({
    String? id,
    String? object,
    List<AssociatedObjects>? associatedObjects,
    num? created,
    num? expires,
    bool? livemode,
    String? secret,
  }) {
    _id = id;
    _object = object;
    _associatedObjects = associatedObjects;
    _created = created;
    _expires = expires;
    _livemode = livemode;
    _secret = secret;
  }

  EphemeralKeyResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _object = json['object'];
    if (json['associated_objects'] != null) {
      _associatedObjects = [];
      json['associated_objects'].forEach((v) {
        _associatedObjects?.add(AssociatedObjects.fromJson(v));
      });
    }
    _created = json['created'];
    _expires = json['expires'];
    _livemode = json['livemode'];
    _secret = json['secret'];
  }

  String? _id;
  String? _object;
  List<AssociatedObjects>? _associatedObjects;
  num? _created;
  num? _expires;
  bool? _livemode;
  String? _secret;

  String? get id => _id ?? "";

  String? get object => _object ?? "";

  List<AssociatedObjects>? get associatedObjects => _associatedObjects ?? [];

  num? get created => _created ?? 0;

  num? get expires => _expires ?? 0;

  bool? get livemode => _livemode ?? false;

  String? get secret => _secret ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['object'] = _object;
    if (_associatedObjects != null) {
      map['associated_objects'] =
          _associatedObjects?.map((v) => v.toJson()).toList();
    }
    map['created'] = _created;
    map['expires'] = _expires;
    map['livemode'] = _livemode;
    map['secret'] = _secret;
    return map;
  }
}
