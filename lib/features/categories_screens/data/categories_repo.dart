import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_model.dart';
import 'package:mega_top_mobile/features/categories_screens/data/selected_categories_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class CategoriesRepo {
  Future<List<CategoriesModel>?> getCategories();

  Future<SelectedCategoriesModel?> getSelectedCategories(int selectedCategory);

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
}
