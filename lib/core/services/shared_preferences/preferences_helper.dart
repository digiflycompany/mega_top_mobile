import 'dart:convert';
import '../../../../core/widgets/main_page_products_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/user_details_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/screens/login_screen.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/pages/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static SharedPreferences? preferences;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static void init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveSelectedAddress({
    required String id,
    required String name,
    required String address,
    required String cityName,
  }) async {
    await preferences?.setString('selectedAddressId', id);
    await preferences?.setString('selectedAddressName', name);
    await preferences?.setString('selectedAddress', address);
    await preferences?.setString('selectedCityName', cityName);
  }

  static Map<String, String?> getSelectedAddress() {
    return {
      'id': preferences?.getString('selectedAddressId'),
      'name': preferences?.getString('selectedAddressName'),
      'address': preferences?.getString('selectedAddress'),
      'cityName': preferences?.getString('selectedCityName'),
    };
  }

  static Future<void> clearSelectedAddress() async {
    await preferences?.remove('selectedAddressId');
    await preferences?.remove('selectedAddressName');
    await preferences?.remove('selectedAddress');
    await preferences?.remove('selectedCityName');
  }

  static Future<void> saveToken({required String token}) async {
    await _secureStorage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: "token");
  }

  // static String get getName {
  //   UserModel? userModel = UserModel.fromJson(
  //       json.decode('${preferences?.getString('userModel')}'));
  //   return userModel.data!.user!.fullName;
  // }

  // static String get getEmail {
  //   UserModel? userModel = UserModel.fromJson(
  //       json.decode('${preferences?.getString('userModel')}'));
  //   return userModel.data!.user!.email ?? '';
  // }

  static String get getPhone {
    UserModel? userModel = UserModel.fromJson(
        json.decode('${preferences?.getString('userModel')}'));
    return userModel.data!.user!.phoneNumber;
  }

  static Future<void> saveWishlist(List<WishlistItem> wishList) async {
    String wishlistJson = json.encode(wishList.map((item) => item.toJson()).toList());
    await preferences?.setString('wishlist', wishlistJson);
  }

  static Future<void> saveCompareList(List<Product> compareList) async {
    String compareListJson = json.encode(compareList.map((item) => item.toJson()).toList());
    await preferences?.setString('compareList', compareListJson);
  }

  static List<WishlistItem> getWishlist() {
    String? wishlistJson = preferences?.getString('wishlist');
    if (wishlistJson != null) {
      List<dynamic> wishlistList = json.decode(wishlistJson);
      return wishlistList.map((item) => WishlistItem.fromJson(item)).toList();
    }
    return [];
  }

  static List<Product> getCompareList() {
    try {
      String? compareListJson = preferences?.getString('compareList');

      if (compareListJson == null || compareListJson.isEmpty) {
        return [];
      }

      List<dynamic> compareList = json.decode(compareListJson) as List<dynamic>;

      // Use a list to collect valid products
      List<Product> products = [];

      for (var item in compareList) {
        try {
          var product = Product.fromJson(item as Map<String, dynamic>);
          products.add(product);
        } catch (e) {
          print('Error parsing product: $e');
          // Skip the invalid product
        }
      }

      return products;
    } catch (e) {
      print('Error retrieving or parsing compare list: $e');
      return [];
    }
  }


  static bool isProductInWishlist(String productId) {
    List<WishlistItem> wishList = getWishlist();
    return wishList.any((item) => item.id == productId);
  }

  static bool isProductInComparisonList(String productId) {
    List<Product> compareList = getCompareList();
    return compareList.any((item) => item.id == productId);
  }

  static Future<void> saveEmail(String email) async {
    await preferences?.setString('email', email);
  }

  // Method to get email
  static String getEmail() {
    return preferences?.getString('email') ?? '';
  }

  static Future<void> saveName(String name) async {
    await preferences?.setString('name', name);
  }

  static String getName() {
    return preferences?.getString('name') ?? '';
  }

  static Future<void> saveWishListCount(int count) async {
    await preferences?.setInt('wishListCount', count);
  }

  static int getWishListCount() {
    return preferences?.getInt('wishListCount') ?? 0;
  }
  static Future<void> saveNotificationCount(int count) async {
    await preferences?.setInt('notificationCount', count);
  }

  static int getNotificationCount() {
    return preferences?.getInt('notificationCount') ?? 0;
  }

  static Future<void> saveIsVisitor({required bool isVisitor}) async {
    await preferences?.setBool("isVisitor", isVisitor);
  }

  static bool get getIsVisitor {
    return preferences?.getBool("isVisitor") ?? false;
  }

  static Future<void> saveUserModel(UserModel userModel) async {
    await preferences?.setString('userModel', json.encode(userModel));
  }

  static UserModel? get getUserModel {
    if (preferences?.getString('userModel') != null) {
      return UserModel.fromJson(
          json.decode('${preferences?.getString('userModel')}'));
    }
    return null;
  }

  static Future<void> logOut() async {
    await _secureStorage.delete(key: "token");
    await preferences?.remove('userModel');
    await preferences?.clear();
  }

  static const String _hasSeenOnboarding = 'hasSeenOnboarding';

  static Future<bool> hasSeenOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasSeenOnboarding) ?? false;
  }

  static Future<void> setHasSeenOnboarding(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_hasSeenOnboarding, value);
  }

  static  getApplicationFirstPage() async {
    return await getToken() != null ? HomePage() : LoginScreen();
  }

  static Future<void> saveCart(List<Map<String, dynamic>> cartProducts) async {
    String cartJson = json.encode(cartProducts);
    await preferences?.setString('cart', cartJson);
  }

  static List<Map<String, dynamic>> getCart() {
    String? cartJson = preferences?.getString('cart');
    if (cartJson != null) {
      List<dynamic> cartList = json.decode(cartJson);
      return cartList.map((item) => item as Map<String, dynamic>).toList();
    }
    return [];
  }

  static Map<String, dynamic> getCartSummary() {
    List<Map<String, dynamic>> cart = getCart();
    int totalQuantity = 0;
    double totalPrice = 0.0;

    for (var item in cart) {
      int quantity = item['quantity'] ?? 0;
      double price = double.tryParse(item['price'].toString()) ?? 0.0;
      totalQuantity += quantity;
      totalPrice += quantity * price;
    }

    return {
      'totalQuantity': totalQuantity,
      'totalPrice': totalPrice,
      'totalItems': cart.length,
    };
  }

  static Future<void> clearCart() async {
    await preferences?.remove('cart');
  }

  static Future<void> increaseQuantity(String productId) async {
    List<Map<String, dynamic>> cart = getCart();
    final productIndex = cart.indexWhere((item) => item['_id'] == productId);

    if (productIndex != -1) {
      cart[productIndex]['quantity'] += 1;
      await saveCart(cart);
    }
  }

  static Future<void> decreaseQuantity(String productId) async {
    List<Map<String, dynamic>> cart = getCart();
    final productIndex = cart.indexWhere((item) => item['_id'] == productId);

    if (productIndex != -1) {
      if (cart[productIndex]['quantity'] > 1) {
        cart[productIndex]['quantity'] -= 1;
      } else {
        cart.removeAt(productIndex);
      }
      await saveCart(cart);
    }
  }

  static Future<void> removeProduct(String productId) async {
    List<Map<String, dynamic>> cart = getCart();
    cart.removeWhere((item) => item['_id'] == productId);
    await saveCart(cart);
  }

}
