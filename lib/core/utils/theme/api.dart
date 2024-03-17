class EndPoints {
  EndPoints._internal();

  /// BASE
  static const String baseUrl =
      'https://megatop.com.eg/wp-json';

  static const String categoriesAPI = 'https://megatop.com.eg/wp-json/wc/v3/products/categories?per_page=100';
  static const String loginAPI = 'https://megatop.com.eg/wp-json/jwt-auth/v1/token';
}
