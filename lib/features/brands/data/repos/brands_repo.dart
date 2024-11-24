import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/services/dio_helper/dio_helper.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/core/widgets/main_page_products_model.dart';
import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart';

abstract class BrandsRepo {
  Future<BrandsResponse?> fetchBrands();
  Future<MainPageProductsModel?> fetchProducts(String brandId, int page);
}

class BrandsRepoImp implements BrandsRepo {
  @override
  Future<BrandsResponse?> fetchBrands() async {
    try {
      Response? response = await DioHelper.getData(
          url: EndPoints.brandsAPI, queryParameters: {"limit": 100});
      if (response != null) {
        return BrandsResponse.fromJson(response.data);
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return null;
  }

  Future<MainPageProductsModel?> fetchProducts(String brandId, int page) async {
    try {
      Response? response = await DioHelper.getData(
          url: EndPoints.productsAPI, queryParameters: {"limit": 100, "bradId": brandId, "page": page});
      if (response != null) {
        return MainPageProductsModel.fromJson(response.data);
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return null;
  }
}