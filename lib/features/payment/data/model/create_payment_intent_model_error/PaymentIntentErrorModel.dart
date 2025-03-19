import 'package:flutter_stripe/flutter_stripe.dart';

import 'Error.dart';

/// error : {"code":"parameter_missing","doc_url":"https://stripe.com/docs/error-codes/parameter-missing","message":"Missing required param: amount.","param":"amount","request_log_url":"https://dashboard.stripe.com/test/logs/req_YNTq8Y3ZdZRiki?t=1741968911","type":"invalid_request_error"}

class PaymentIntentErrorModel {
  PaymentIntentErrorModel({
    Error? error,
  }) {
    _error = error;
  }

  PaymentIntentErrorModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic> && json.containsKey("error")) {
      _error = Error.fromJson(json['error']); // Handling JSON response
    } else if (json is StripeException) {
      _error = Error(message: json.error.localizedMessage); // Handling StripeException
    } else {
      _error = Error(message: "Unknown error occurred");
    }
  }

  Error? _error;

  Error? get error => _error ?? Error();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_error != null) {
      map['error'] = _error?.toJson();
    }
    return map;
  }
}
