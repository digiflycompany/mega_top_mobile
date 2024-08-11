import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/offers_screens/data/offer_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class OffersRepo{
  Future<OfferModel?> getOffers({required int page, int ? minPrice, int ? maxPrice});
}


class OfferRepoImp implements OffersRepo{
  @override
  Future<OfferModel?> getOffers({
    required int page,
     int ? minPrice,
     int ? maxPrice
  }) async {
    late OfferModel offerModel;
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

}