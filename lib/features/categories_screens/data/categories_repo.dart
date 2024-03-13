import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class CategoriesRepo {
  Future<Response?> getCategories();
}

class CategoriesRepoImp implements CategoriesRepo {
  @override
  Future<Response?> getCategories() async {
    Response? response =
    await DioHelper.getData(url: EndPoints.categories);
    return response;
  }
}
