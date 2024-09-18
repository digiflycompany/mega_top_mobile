import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/services/dio_helper/dio_helper.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/categories_screens/data/subcategories_model.dart';
import 'package:mega_top_mobile/features/offers_screens/data/offer_model.dart';

abstract class OffersRepo{
  Future<OfferModel?> getOffers({required int page, int ? minPrice, int ? maxPrice});
  Future<SubCategoriesModel?> getSubCategories({required String categoryId});

}


class OfferRepoImp implements OffersRepo{
  @override
  Future<OfferModel?> getOffers({
    required int page,
     int ? minPrice,
     int ? maxPrice
  }) async {
    OfferModel ? offerModel;
    try {
      Response? response =
      await DioHelper.getData(url: EndPoints.lastOfferAPI,
          queryParameters: {"page": page,if(minPrice != null) "minPrice":minPrice,if(maxPrice != null)"maxPrice":maxPrice});
      offerModel = OfferModel.fromJson(response?.data);
    } catch (e) {
      print('Error fetching categories: $e');
    }
    return offerModel;
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

}