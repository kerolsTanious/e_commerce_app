/// id : "pmc_1R1qP8DwUpql7AnyPKnqqISl"
/// parent : null

class PaymentMethodConfigurationDetails {
  PaymentMethodConfigurationDetails({
      String? id, 
      dynamic parent,}){
    _id = id;
    _parent = parent;
}

  PaymentMethodConfigurationDetails.fromJson(dynamic json) {
    _id = json['id'];
    _parent = json['parent'];
  }
  String? _id;
  dynamic _parent;

  String? get id => _id;
  dynamic get parent => _parent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent'] = _parent;
    return map;
  }

}