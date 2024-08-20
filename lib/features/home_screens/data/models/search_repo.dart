import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/product_details_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/subcategories_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/search_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class SearchRepo {
  Future<CategoriesModel?> getCategories();

  // Future<OrderList?> getMyOrders(int customerID);

  Future<ProductDetailsModel?> getProductDetails(int productID);

  Future<SearchModel?> getSearch({required int page,
    int ? minPrice, int ? maxPrice,List<String> subCategories,required String ? searchWord});
  Future<SubCategoriesModel?> getSubCategories({required String categoryId});

  // Future<Order?> makeOrder(int customerId, int productId, int quantity);

  Future<void> addToWishList(String ProductId, String token);
}




class CategoriesRepoImp implements SearchRepo {
  @override
  Future<CategoriesModel?> getCategories() async {
    try {
      Response? response =
          await DioHelper.getData(url: EndPoints.categoriesAPI,queryParameters: {"limit":100});
      print(response?.data);
      print("response?.data");
      if (response?.data != null) {
        CategoriesModel categories = CategoriesModel.fromJson(response?.data);
        return categories;
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return null;
  }

  @override
  Future<SearchModel?> getSearch({
      required int page,
      int ? minPrice,
      int ? maxPrice,
      String ? searchWord,
      List<String> ? subCategories,
  }) async {
    SearchModel ? selectedCategories;
    try {
      Response? response =
      await DioHelper.getData(url: EndPoints.selectedCategoriesAPI,
          queryParameters: {"page": page, if(minPrice != null) "minPrice": minPrice,
            if(maxPrice != null) "maxPrice": maxPrice,
            "searchField":searchWord});
         selectedCategories = SearchModel.fromJson(response?.data);
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return selectedCategories;
  }

  @override
  Future<SubCategoriesModel?> getSubCategories({required String categoryId}) async {
     SubCategoriesModel ? subCategoriesModel;
    try {
      Response? response =
          await DioHelper.getData(url: EndPoints.subCategoriesAPI,
          queryParameters: {"categoryId": categoryId,"limit": 100});
      subCategoriesModel = SubCategoriesModel.fromJson(response?.data);
    } catch (e) {
      print('Error fetching SubCategories: $e');
    }
    return subCategoriesModel;
  }

  @override
  Future<void> addToWishList(String productId, String token) async {
    await DioHelper.postData(
        url: EndPoints.addToWishListAPI,
        queryParameters: {"token": token},
        data: {"id": productId}).then((value) {
      print(value!.data);
    });
  }

  @override
  // Future<Order?> makeOrder(int customerId, int productId, int quantity) async {
  //   try {
  //     Response? response =
  //         await DioHelper.postData(url: EndPoints.makeOrderAPI, data: {
  //       "customer_id": customerId,
  //       "line_items": [
  //         {
  //           "product_id": productId,
  //           "quantity": quantity,
  //         },
  //         {
  //           "product_id": productId,
  //           "quantity": quantity,
  //         }
  //       ]
  //     });
  //     if (response != null && response.statusCode == 200) {
  //       Order order = Order.fromJson(response.data);
  //       return order;
  //     }
  //   } catch (e) {
  //     print('Error during login: $e');
  //   }
  //   return null;
  // }

  // @override
  // Future<OrderList?> getMyOrders(int customerID) async {
  //   try {
  //     Response? response =
  //         await DioHelper.getData(url: EndPoints.myOrdersAPI, queryParameters: {
  //       "customer": customerID,
  //     });
  //     if (response?.data != null && response?.data is List) {
  //       OrderList orders = OrderList.fromJson(response?.data);
  //       return orders;
  //     }
  //   } catch (e) {
  //     print('Error fetching categories: $e');
  //   }
  //   return null;
  // }

  @override
  Future<ProductDetailsModel?> getProductDetails(int productID) async {
    try {
      Response? response = await DioHelper.getData(
        url: "https://megatop.com.eg/wp-json/wc/v3/products/1988",
      ).then((value) {
        print(value!.data);
        print(
            'abanoubbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
        return null;
      });
      ProductDetailsModel productModel =
          ProductDetailsModel.fromJson(response?.data);
      return productModel;
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return null;
  }


}
