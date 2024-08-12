import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  static Future<void> saveToken({required String token}) async {
    await _secureStorage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: "token");
  }

  static String get getName {
    UserModel? userModel = UserModel.fromJson(
        json.decode('${preferences?.getString('userModel')}'));
    return userModel.data!.user!.fullName ?? '';
  }

  static String get getEmail {
    UserModel? userModel = UserModel.fromJson(
        json.decode('${preferences?.getString('userModel')}'));
    return userModel.data!.user!.email ?? '';
  }

  static String get getPhone {
    UserModel? userModel = UserModel.fromJson(
        json.decode('${preferences?.getString('userModel')}'));
    return userModel.data!.user!.phoneNumber ?? '';
  }

  static Future<void> saveWishListCount(int count) async {
    await preferences?.setInt('wishListCount', count);
  }

  static int getWishListCount() {
    return preferences?.getInt('wishListCount') ?? 0;
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
    preferences?.remove('userModel');
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
