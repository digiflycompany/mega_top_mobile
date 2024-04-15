import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_details_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/latest_product_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

abstract class HomePageRepo {

  Future<UserDetailsModel?> getUserDetails();

  Future <List<LatestProductsModel>?> getLatestProduct();
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
      print("Error fetching user details: ${onError.toString()}"); // More detailed error logging
    }
    print(userDetailsModel!.data!.fullName);
    return userDetailsModel;

  }

  @override
  // Future<List<LatestProductsModel>?> getLatestProduct() async {
  //   try {
  //     Response? response =
  //     await DioHelper.getData(url: EndPoints.latestProductsAPI);
  //     if (response?.data != null && response?.data is List) {
  //       List<LatestProductsModel> latestProductModel =
  //       LatestProductsModel.fromJsonList(response?.data);
  //       return latestProductModel;
  //     }
  //   } catch (e) {
  //     print('Error fetching latest products: $e');
  //   }
  //   return null;
  // }
  Future<List<LatestProductsModel>?> getLatestProduct() async {
    try {
      var response = await DioHelper.getData(url: EndPoints.latestProductsAPI);
      if (response != null && response.data != null) {
        print("Latesttyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
        print('API Response: ${response.data}');  // Log raw response data
        if (response.data is List) {
          var products = LatestProductsModel.fromJsonList(response.data);
          print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD');
          print(products[0].name);
          return products;
        } else {
          print('Error: Expected a list but got ${response.data.runtimeType}');
        }
      }
    } catch (e) {
      print('Error fetching latest products: $e');
    }
    return null;
  }



}
