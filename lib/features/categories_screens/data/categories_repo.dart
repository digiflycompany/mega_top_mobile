import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/order_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/selected_categories_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class CategoriesRepo {
  Future<List<CategoriesModel>?> getCategories();

  Future<SelectedCategoriesModel?> getSelectedCategories(int selectedCategory);

  Future<Order?> makeOrder(int customerId, int productId, int quantity);

  Future<void> addToWishList(String ProductId,String token);
}

class CategoriesRepoImp implements CategoriesRepo {
  @override
  Future<List<CategoriesModel>?> getCategories() async {
    try {
      Response? response =
          await DioHelper.getData(url: EndPoints.categoriesAPI);
      if (response?.data != null && response?.data is List) {
        List<CategoriesModel> categories =
            CategoriesModel.fromJsonList(response?.data);
        return categories;
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return null;
  }

  @override
  Future<SelectedCategoriesModel?> getSelectedCategories(
      int selectedCategory) async {
    SelectedCategoriesModel? selectedCategoriesModel;
    await DioHelper.getData(
        url: "https://megatop.com.eg/wp-json/wc/v3/products",
        queryParameters: {
          "category": selectedCategory,
          "per_page": 8,
          "page": 1
        }).then((value) {
      selectedCategoriesModel = SelectedCategoriesModel.fromJson(value?.data);
      print("${selectedCategoriesModel!.productList.length}" + "products");
    }).catchError((onError) {
      print(onError.toString() + "??????");
    });
    return selectedCategoriesModel;
  }

  @override
  Future<void> addToWishList(String productId,String token) async {
   await DioHelper.postData(url: EndPoints.addWishList,queryParameters: {"token" : token},data: {"id":productId}).then((value) {
      print(value!.data);
    });
  }

  @override
  Future<Order?> makeOrder(int customerId, int productId, int quantity) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.makeOrderAPI,
        data: {
          "customer_id": customerId,
          "product_id": productId,
          "quantity": quantity,
        },
      );
      if (response != null && response.statusCode == 200) {
        Order order = Order.fromJson(response.data);
        return order;
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return null;
  }

}
