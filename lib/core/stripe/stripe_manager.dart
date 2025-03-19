import 'package:e_commerce_app_route/core/api/api_services.dart';
import 'package:e_commerce_app_route/core/api/end_points.dart';
import 'package:e_commerce_app_route/core/api_keys.dart';
import 'package:e_commerce_app_route/core/constants.dart';
import 'package:e_commerce_app_route/core/utils/prefs.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_ephemeral_key/EphemeralKeyResponseModel.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_input.dart';
import 'package:e_commerce_app_route/features/payment/data/model/create_payment_intent_model/PaymentIntentModel.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeManager {
  final ApiManager apiManager;

  StripeManager({required this.apiManager});

  Future<PaymentIntentModel> createPaymentIntent({
    required CreatePaymentIntentInput input,
  }) async {
    var response = await apiManager.postRequest(
      baseUrl: Constants.stripePaymentBaseUrl,
      endPoint: EndPoints.createPaymentIntent,
      body: input.toJson(),
      contentType: 'application/x-www-form-urlencoded',
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretStripeKey}',
      },
    );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<String> createEphemeralKey({required String customerId}) async {
    var response = await apiManager.postRequest(
      baseUrl: Constants.stripePaymentBaseUrl,
      endPoint: EndPoints.createEphemeralKey,
      contentType: 'application/x-www-form-urlencoded',
      body: {"customer": customerId},
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretStripeKey}',
        "Stripe-Version": "2025-02-24.acacia",
      },
    );
    EphemeralKeyResponseModel ephemeralKeyResponseModel =
        EphemeralKeyResponseModel.fromJson(response.data);
    String ephemeralKey = ephemeralKeyResponseModel.secret ?? "";
    return ephemeralKey;
  }

  Future initPaymentSheet(
      {required String paymentIntentClientSecret,
      required String customerEphemeralKeySecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'kerols tanious',
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerEphemeralKeySecret: customerEphemeralKeySecret,
        customerId: PrefsHelper.getString(key: PrefsKeys.customerId),
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<PaymentIntentModel> makePayment(
      {required CreatePaymentIntentInput input}) async {
    PaymentIntentModel response = await createPaymentIntent(input: input);

    String ephemeralKey = await createEphemeralKey(
      customerId: PrefsHelper.getString(key: PrefsKeys.customerId),
    );

    await initPaymentSheet(
      paymentIntentClientSecret: response.clientSecret ?? "",
      customerEphemeralKeySecret: ephemeralKey,
    );

    await displayPaymentSheet();

    return response;
  }
}
