import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_details_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_offer_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

abstract class HomePageRepo {
  Future<UserDetailsModel?> getUserDetails();
  Future<LatestOfferModel?> getLastOffers();
}

class HomePageRepoImp implements HomePageRepo {
  @override
  Future<UserDetailsModel?> getUserDetails() async {
    UserDetailsModel? userDetailsModel;
    try {
      final response = await DioHelper.getData(
        url: EndPoints.userDetailsAPI,
        queryParameters: {
          "token": PreferencesHelper.getToken(),
        },
      );
      print("API Response: ${response!.data}"); // Debugging line
      userDetailsModel = UserDetailsModel.fromJson(response.data);
    } catch (onError) {
      print(
          "Error fetching user details: ${onError.toString()}"); // More detailed error logging
    }
    print(userDetailsModel!.data!.fullName);
    return userDetailsModel;
  }

  Future<LatestOfferModel?> getLastOffers() async {
    LatestOfferModel? latestOfferModel;
    try {
      final response = await DioHelper.getData(
        url: EndPoints.lastOfferAPI,
      );
      print("API Response: ${response!.data}"); // Debugging line
      latestOfferModel = LatestOfferModel.fromJson(response.data);
    } catch (onError) {
      print(
          "Error fetching user details: ${onError.toString()}"); // More detailed error logging
    }
    return latestOfferModel;
  }
}
