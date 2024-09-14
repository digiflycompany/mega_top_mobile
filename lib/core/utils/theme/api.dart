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
  // static const String myOrdersAPI =
  //     '$baseUrl/api/v1/orders?page=1&limit=1&completed=false';
  static const String lastOfferAPI =
      '$baseUrl/api/v1/products?isOffer=true';
  static const String userAddressesAPI =
      '$baseUrl/api/v1/addresses/';
  static const String addAddressAPI =
      '$baseUrl/api/v1/addresses';
  static const String citiesAPI =
      '$baseUrl/api/v1/cities?limit=100&sortOrder=asc';
  static const String categoriesAPI = '$baseUrl/api/v1/categories/';
  static const String addToCartAPI = '$baseUrl/api/v1/users/customers/cart';
  static const String getUserCartAPI = '$baseUrl/api/v1/users/customers/cart';
  static const String checkoutAPI = '$baseUrl/api/v1/orders/customer-checkout';
  static const String latestOffersAPI = '$baseUrl/api/v1/products?isOffer=true';
  static const String latestProductsAPI = '$baseUrl/api/v1/products?sortOrder=desc';
  static const String homeScreenAddsAPI = '$baseUrl/api/v1/advertisements';
  static const String selectedCategoriesAPI =
      '$baseUrl/api/v1/products';
  static const String subCategoriesAPI =
      '$baseUrl/api/v1/subcategories';
  static String notificationsAPI(String contentType) {
    return '$baseUrl/api/v1/notifications?contentType=$contentType';
  }
  static String removeAddressAPI(String addressID) {
    return '$baseUrl/api/v1/addresses/$addressID';
  }
  static String myOrdersAPI(int page,int limit) {
    return '$baseUrl/api/v1/orders?page=$page&limit=$limit&completed=false';
  }
  static String updateAddressAPI(String addressID) {
    return '$baseUrl/api/v1/addresses/$addressID';
  }
  static String myOrderAPI(String orderId) {
    return '$baseUrl/api/v1/orders/$orderId';
  }
}
