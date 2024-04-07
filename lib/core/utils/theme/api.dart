class EndPoints {
  EndPoints._internal();

  /// BASE
  static const String baseUrl = 'https://megatop.com.eg/wp-json';

  static const String categoriesAPI =
      'https://megatop.com.eg/wp-json/wc/v3/products/categories?per_page=100';
  static const String loginAPI =
      'https://megatop.com.eg/wp-json/jwt-auth/v1/token';
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
}
