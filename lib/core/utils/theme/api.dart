class EndPoints {
  EndPoints._internal();

  /// BASE
  static const String baseUrl = 'https://api.megatop.com.eg';

  static const String loginAPI = '$baseUrl/api/v1/users/login';
  static const String signUpAPI =
      'https://megatop.com.eg/wp-json/custom/v1/register';
  static const String activateEmailAPI =
      'https://megatop.com.eg/wp-json/custom/v1/activate';
  static const String resetPasswordAPI =
      'https://megatop.com.eg/wp-json/custom/v1/reset-password';
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
  static const String categoriesAPI = '$baseUrl/api/v1/categories/';
  static const String selectedCategoriesAPI =
      '$baseUrl/api/v1/products';
}
