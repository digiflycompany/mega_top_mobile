import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/services/dio_helper/dio_helper.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/brands/data/models/brands_response.dart';

abstract class BrandsRepo {
  Future<BrandsResponse?> fetchBrands();
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
}