import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/core/utils/theme/wish_list_model.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class GlobalRepo {
  Future<WishListModel?> addToWishList(String productId);
  Future<WishListModel?> removeFromWishList(String productId);
  Future<MainPageProductsModel?> getLatestOffersProducts();
  Future<MainPageProductsModel?> getLatestProducts();
}

class GlobalRepoImp implements GlobalRepo {

  @override
  Future<WishListModel?> addToWishList(String productId) async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.addToWishListAPI,
        data: {
          "productId": productId,
        },
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401 || response?.statusCode == 400) {
        return WishListModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during adding product to wish list: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<WishListModel?> removeFromWishList(String productId) async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.removeFromWishListAPI,
        data: {
          "productId": productId,
        },
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401 || response?.statusCode == 400) {
        return WishListModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during removing product from wish list: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<MainPageProductsModel?> getLatestOffersProducts() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.latestOffersAPI,
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401 || response?.statusCode == 400) {
        return MainPageProductsModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting latest offers: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<MainPageProductsModel?> getLatestProducts() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.latestProductsAPI,
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401 || response?.statusCode == 400) {
        return MainPageProductsModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting latest products: $e');
      throw e;
    }
    return null;
  }

}

