import 'InvoiceSettings.dart';

/// id : "cus_RwVWhHvvSKpiOT"
/// object : "customer"
/// address : null
/// balance : 0
/// created : 1741975121
/// currency : null
/// default_source : null
/// delinquent : false
/// description : null
/// discount : null
/// email : null
/// invoice_prefix : "C94C56D3"
/// invoice_settings : {"custom_fields":null,"default_payment_method":null,"footer":null,"rendering_options":null}
/// livemode : false
/// metadata : {}
/// name : null
/// next_invoice_sequence : 1
/// phone : null
/// preferred_locales : []
/// shipping : null
/// tax_exempt : "none"
/// test_clock : null

class CreateCustomerResponseModel {
  CreateCustomerResponseModel({
    String? id,
    String? object,
    dynamic address,
    num? balance,
    num? created,
    dynamic currency,
    dynamic defaultSource,
    bool? delinquent,
    dynamic description,
    dynamic discount,
    dynamic email,
    String? invoicePrefix,
    InvoiceSettings? invoiceSettings,
    bool? livemode,
    dynamic metadata,
    dynamic name,
    num? nextInvoiceSequence,
    dynamic phone,
    List<dynamic>? preferredLocales,
    dynamic shipping,
    String? taxExempt,
    dynamic testClock,
  }) {
    _id = id;
    _object = object;
    _address = address;
    _balance = balance;
    _created = created;
    _currency = currency;
    _defaultSource = defaultSource;
    _delinquent = delinquent;
    _description = description;
    _discount = discount;
    _email = email;
    _invoicePrefix = invoicePrefix;
    _invoiceSettings = invoiceSettings;
    _livemode = livemode;
    _metadata = metadata;
    _name = name;
    _nextInvoiceSequence = nextInvoiceSequence;
    _phone = phone;
    _preferredLocales = preferredLocales;
    _shipping = shipping;
    _taxExempt = taxExempt;
    _testClock = testClock;
  }

  CreateCustomerResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _object = json['object'];
    _address = json['address'];
    _balance = json['balance'];
    _created = json['created'];
    _currency = json['currency'];
    _defaultSource = json['default_source'];
    _delinquent = json['delinquent'];
    _description = json['description'];
    _discount = json['discount'];
    _email = json['email'];
    _invoicePrefix = json['invoice_prefix'];
    _invoiceSettings = json['invoice_settings'] != null
        ? InvoiceSettings.fromJson(json['invoice_settings'])
        : null;
    _livemode = json['livemode'];
    _metadata = json['metadata'];
    _name = json['name'];
    _nextInvoiceSequence = json['next_invoice_sequence'];
    _phone = json['phone'];
    if (json['preferred_locales'] != null) {
      _preferredLocales = [];
      json['preferred_locales'].forEach((v) {
        _preferredLocales?.add(v.fromJson(v));
      });
    }
    _shipping = json['shipping'];
    _taxExempt = json['tax_exempt'];
    _testClock = json['test_clock'];
  }

  String? _id;
  String? _object;
  dynamic _address;
  num? _balance;
  num? _created;
  dynamic _currency;
  dynamic _defaultSource;
  bool? _delinquent;
  dynamic _description;
  dynamic _discount;
  dynamic _email;
  String? _invoicePrefix;
  InvoiceSettings? _invoiceSettings;
  bool? _livemode;
  dynamic _metadata;
  dynamic _name;
  num? _nextInvoiceSequence;
  dynamic _phone;
  List<dynamic>? _preferredLocales;
  dynamic _shipping;
  String? _taxExempt;
  dynamic _testClock;

  String? get id => _id ?? "";

  String? get object => _object ?? "";

  dynamic get address => _address ?? dynamic;

  num? get balance => _balance ?? 0;

  num? get created => _created ?? 0;

  dynamic get currency => _currency ?? dynamic;

  dynamic get defaultSource => _defaultSource ?? dynamic;

  bool? get delinquent => _delinquent ?? false;

  dynamic get description => _description ?? dynamic;

  dynamic get discount => _discount ?? dynamic;

  dynamic get email => _email ?? dynamic;

  String? get invoicePrefix => _invoicePrefix ?? "";

  InvoiceSettings? get invoiceSettings => _invoiceSettings ?? InvoiceSettings();

  bool? get livemode => _livemode ?? false;

  dynamic get metadata => _metadata ?? dynamic;

  dynamic get name => _name ?? dynamic;

  num? get nextInvoiceSequence => _nextInvoiceSequence ?? 0;

  dynamic get phone => _phone ?? dynamic;

  List<dynamic>? get preferredLocales => _preferredLocales ?? [];

  dynamic get shipping => _shipping ?? dynamic;

  String? get taxExempt => _taxExempt ?? "";

  dynamic get testClock => _testClock ?? dynamic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['object'] = _object;
    map['address'] = _address;
    map['balance'] = _balance;
    map['created'] = _created;
    map['currency'] = _currency;
    map['default_source'] = _defaultSource;
    map['delinquent'] = _delinquent;
    map['description'] = _description;
    map['discount'] = _discount;
    map['email'] = _email;
    map['invoice_prefix'] = _invoicePrefix;
    if (_invoiceSettings != null) {
      map['invoice_settings'] = _invoiceSettings?.toJson();
    }
    map['livemode'] = _livemode;
    map['metadata'] = _metadata;
    map['name'] = _name;
    map['next_invoice_sequence'] = _nextInvoiceSequence;
    map['phone'] = _phone;
    if (_preferredLocales != null) {
      map['preferred_locales'] =
          _preferredLocales?.map((v) => v.toJson()).toList();
    }
    map['shipping'] = _shipping;
    map['tax_exempt'] = _taxExempt;
    map['test_clock'] = _testClock;
    return map;
  }
}
