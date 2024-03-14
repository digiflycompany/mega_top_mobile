import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/categories_screens/data/categories_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class CategoriesRepo {
  Future<List<CategoriesModel>?> getCategories();
}

class CategoriesRepoImp implements CategoriesRepo {
  @override
  Future<List<CategoriesModel>?> getCategories() async {
    try {
      Response? response = await DioHelper.getData(url: EndPoints.categories);
      if (response?.data != null && response?.data is List) {
        List<CategoriesModel> categories = CategoriesModel.fromJsonList(response?.data);
        return categories;
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return null;
  }


}
