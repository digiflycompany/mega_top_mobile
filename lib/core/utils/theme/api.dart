class EndPoints {
  EndPoints._internal();

  /// BASE
  //static const String baseUrl = 'https://api.megatop.com.eg';
  static const String baseUrl = 'http://144.76.110.163:3005';
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
  static const String userAddressesAPI =
      '$baseUrl/api/v1/addresses/';
  static const String addAddressAPI =
      '$baseUrl/api/v1/addresses';
  static const String citiesAPI =
      '$baseUrl/api/v1/cities?limit=100';
  static const String latestProductsAPI =
      'https://megatop.com.eg/wp-json/custom/v2/latest_products';
  static const String categoriesAPI = '$baseUrl/api/v1/categories/';
  static const String selectedCategoriesAPI =
      '$baseUrl/api/v1/products';
  static String notificationsAPI(String contentType) {
    return '$baseUrl/api/v1/notifications?contentType=$contentType';
  }
  static String removeAddressAPI(String addressID) {
    return '$baseUrl/api/v1/addresses/$addressID';
  }
  static String updateAddressAPI(String addressID) {
    return '$baseUrl/api/v1/addresses/$addressID';
  }
}
