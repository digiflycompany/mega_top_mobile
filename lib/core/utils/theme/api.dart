class EndPoints {
  EndPoints._internal();

  /// BASE
  static const String baseUrl = 'https://api.megatop.com.eg';
  static const String loginAPI = '$baseUrl/api/v1/users/login';
  static const String signUpAPI = '$baseUrl/api/v1/users/signup';
  static const String verifyEmailAPI = '$baseUrl/api/v1/users/verify-email';
  static const String resendEmailVerificationCode =
      '$baseUrl/api/v1/users/generate-code';
  static const String resetPasswordAPI = '$baseUrl/api/v1/users/reset-password';
  static const String verifyResetPasswordAPI =
      '$baseUrl/api/v1/users/verify-reset-password';
  static const String accountDetailsAPI = '$baseUrl/api/v1/profile';
  static const String updateAccountDetailsAPI = '$baseUrl/api/v1/profile';
  static const String deleteAccountAPI = '$baseUrl/api/v1/profile/deactivate';
  static const String addToWishListAPI =
      '$baseUrl/api/v1/users/customers/wishlist/add';
  static const String removeFromWishListAPI =
      '$baseUrl/api/v1/users/customers/wishlist/remove';
  static const String makeOrderAPI =
      'https://megatop.com.eg/wp-json/wc/v3/orders';
  static const String myOrdersAPI =
      'https://megatop.com.eg/wp-json/wc/v3/orders';
  static const String lastOfferAPI =
      'https://megatop.com.eg/wp-json/custom/v2/latest_offer';
  static const String latestProductsAPI =
      'https://megatop.com.eg/wp-json/custom/v2/latest_products';
  static const String categoriesAPI = '$baseUrl/api/v1/categories/';
  static const String selectedCategoriesAPI =
      '$baseUrl/api/v1/products';

  static String notificationsAPI(String contentType) {
    return '$baseUrl/api/v1/notifications?contentType=$contentType';
  }
}
