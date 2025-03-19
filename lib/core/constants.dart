class Constants {
  static const String baseUrl = "https://ecommerce.routemisr.com/";

  static RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static RegExp gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

  static RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  static RegExp mobileNumberRegex = RegExp(r'^01[0-9]{9}$');

  static const String stripePaymentBaseUrl = "https://api.stripe.com/";
}
