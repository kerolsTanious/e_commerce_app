import 'package:e_commerce_app_route/core/utils/prefs.dart';

class CreatePaymentIntentInput {
  final num amount;
  final String currency;

  CreatePaymentIntentInput({required this.amount, required this.currency});

  Map<String, dynamic> toJson() {
    return {
      "amount": amount * 100,
      "currency": currency,
      "customer": PrefsHelper.getString(key: PrefsKeys.customerId),
    };
  }
}
