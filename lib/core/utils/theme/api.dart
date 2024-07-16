class EndPoints {
  EndPoints._internal();

  /// BASE
  static const String baseUrl = 'https://api.megatop.com.eg';

  static const String categoriesAPI =
      'https://megatop.com.eg/wp-json/wc/v3/products/categories?per_page=100';
  static const String loginAPI = '$baseUrl/api/v1/users/login';
  static const String signUpAPI = '$baseUrl/api/v1/users/signup';
  static const String verifyEmailAPI = '$baseUrl/api/v1/users/verify-email';
  static const String resendEmailVerificationCode =
      '$baseUrl/api/v1/users/generate-code';
  static const String resetPasswordAPI = '$baseUrl/api/v1/users/reset-password';
  static const String verifyResetPasswordAPI =
      '$baseUrl/api/v1/users/verify-reset-password';
  static const String updatePasswordAPI =
      'https://megatop.com.eg/wp-json/custom/v1/update-password';
  static const String addWishList =
      'https://megatop.com.eg/wp-json/custom/v1/wishlist_add';
  static const String userDetailsAPI =
      'https://megatop.com.eg/wp-json/custom/v1/user_data';
  static const String makeOrderAPI =
      'https://megatop.com.eg/wp-json/wc/v3/orders';
  static const String myOrdersAPI =
      'https://megatop.com.eg/wp-json/wc/v3/orders';
  static const String lastOfferAPI =
      'https://megatop.com.eg/wp-json/custom/v2/latest_offer';
  static const String latestProductsAPI =
      'https://megatop.com.eg/wp-json/custom/v2/latest_products';
  static const String deleteAccountAPI =
      'https://megatop.com.eg/wp-json/custom/v1/users/delete/';
}
