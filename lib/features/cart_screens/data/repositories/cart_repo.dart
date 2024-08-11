import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/cart_screens/data/models/add_to_cart_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class CartRepo {
  Future<AddToCartModel?> addProductsToCart(List<Map<String, dynamic>> products);
}

class CartRepoImp implements CartRepo {

  @override
  Future<AddToCartModel?> addProductsToCart(List<Map<String, dynamic>> products) async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.addToCartAPI,
        data: {
          "products": products,
        },
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 403 || response?.statusCode == 400) {
        return AddToCartModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during adding products to cart: $e');
      throw e;
    }
    return null;
  }
}

