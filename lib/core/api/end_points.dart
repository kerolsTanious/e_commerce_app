class EndPoints {
  static const String allCategoryEndPoint = "api/v1/categories";
  static const String allBrandsEndPoint = "api/v1/brands";
  static const String allProductsEndPoint = "api/v1/products";

  static String allSubCategoryByIdEndPoint({required String id}) {
    return "api/v1/categories/$id/subcategories";
  }

  static const String signUpEndPoint = "api/v1/auth/signup";
  static const String loginEndPoint = "api/v1/auth/signin";
  static const String addProductToCartEndPoint = "api/v1/cart";
  static const String getProductsCartEndPoint = "api/v1/cart";

  static String updateCartItemsEndPoint({required String productId}) {
    return "api/v1/cart/$productId";
  }

  static String deleteCartSpecificItemEndPoint({required String productId}) {
    return "api/v1/cart/$productId";
  }

  static const String getAllProductsByCategory = "api/v1/products";
  static const String getAllProductsByBrand = "api/v1/products";
  static const String updateProfileData = 'api/v1/users/updateMe/';
  static const String createPaymentIntent = "v1/payment_intents";
  static const String createCustomerForStripe = "v1/customers";
  static const String createEphemeralKey = "v1/ephemeral_keys";
}
