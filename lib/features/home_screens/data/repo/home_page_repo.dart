// import 'package:mega_top_mobile/core/utils/theme/api.dart';
// import 'package:mega_top_mobile/features/authentication_screens/data/models/user_details_model.dart';
// import 'package:mega_top_mobile/features/home_screens/data/models/latest_offer_model.dart';
// import 'package:mega_top_mobile/features/home_screens/data/models/latest_product_model.dart';
// import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';
// import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
//
// abstract class HomePageRepo {
//   Future<UserDetailsModel?> getUserDetails();
//   Future<LatestOfferModel?> getLastOffers();
//
//   Future <List<LatestProductsModel>?> getLatestProduct();
// }
//
// class HomePageRepoImp implements HomePageRepo {
//   @override
//   Future<UserDetailsModel?> getUserDetails() async {
//     UserDetailsModel? userDetailsModel;
//     try {
//       final response = await DioHelper.getData(
//         url: EndPoints.userDetailsAPI,
//         queryParameters: {
//           "token": PreferencesHelper.getToken(),
//         },
//       );
//       print("API Response: ${response!.data}"); // Debugging line
//       userDetailsModel = UserDetailsModel.fromJson(response.data);
//     } catch (onError) {
//       print(
//           "Error fetching user details: ${onError.toString()}"); // More detailed error logging
//     }
//     print(userDetailsModel!.data!.fullName);
//     return userDetailsModel;
//   }
//
//   @override
//   // Future<List<LatestProductsModel>?> getLatestProduct() async {
//   //   try {
//   //     Response? response =
//   //     await DioHelper.getData(url: EndPoints.latestProductsAPI);
//   //     if (response?.data != null && response?.data is List) {
//   //       List<LatestProductsModel> latestProductModel =
//   //       LatestProductsModel.fromJsonList(response?.data);
//   //       return latestProductModel;
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching latest products: $e');
//   //   }
//   //   return null;
//   // }
//   Future<List<LatestProductsModel>?> getLatestProduct() async {
//     try {
//       var response = await DioHelper.getData(url: EndPoints.latestProductsAPI);
//       if (response != null && response.data != null) {
//         print("Latesttyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
//         print('API Response: ${response.data}');  // Log raw response data
//         if (response.data is List) {
//           var products = LatestProductsModel.fromJsonList(response.data);
//           print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD');
//           print(products[0].name);
//           return products;
//         } else {
//           print('Error: Expected a list but got ${response.data.runtimeType}');
//         }
//       }
//     } catch (e) {
//       print('Error fetching latest products: $e');
//     }
//     return null;
//   }
//
//
//
//   Future<LatestOfferModel?> getLastOffers() async {
//     LatestOfferModel? latestOfferModel;
//     try {
//       final response = await DioHelper.getData(
//         url: EndPoints.lastOfferAPI,
//       );
//       print("API Response: ${response!.data}"); // Debugging line
//       latestOfferModel = LatestOfferModel.fromJson(response.data);
//     } catch (onError) {
//       print(
//           "Error fetching user details: ${onError.toString()}"); // More detailed error logging
//     }
//     return latestOfferModel;
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/Errors/failures.dart';
import 'package:mega_top_mobile/core/utils/Errors/models/api_error_model.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/logger.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/ad_details_model.dart';
import 'package:mega_top_mobile/features/home_screens/data/models/advertisement_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class HomeRepo {
  Future<Either<Failure, AdvertisementModel>> fetchHomeAds();
  Future<Either<Either<bool, Failure>, AdDetailsModel>> fetchAdDetails(
      String id);
}

class HomeRepoImp implements HomeRepo {
  @override
  Future<Either<Failure, AdvertisementModel>> fetchHomeAds() async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.homeAds,
        options: await DioHelper.getOptions(),
      );
      DefaultLogger.logger.w(response);
      return Right(AdvertisementModel.fromJson(response?.data));
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromResponse(error.response!.statusCode,
            ApiErrorResponse.fromJson(error.response!.data)));
      } else {
        return Left(ServerFailure("Something went wrong"));
      }
    }
  }

  @override
  Future<Either<Either<bool, Failure>, AdDetailsModel>> fetchAdDetails(
      String id) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.selectedCategoriesAPI + '/' + id,
        options: await DioHelper.getOptions(),
      );
      DefaultLogger.logger.w(response);
      return Right(AdDetailsModel.fromJson(response?.data));
    } catch (error) {
      DefaultLogger.logger.d(error);
      if (error is DioException) {
        if (error.error == AppStrings.noInternetConnection)
          return Left(Left(true));
        else
          return Left(Right(ServerFailure.fromResponse(
              error.response!.statusCode,
              ApiErrorResponse.fromJson(error.response!.data))));
      } else {
        return Left(Right(ServerFailure("Something went wrong")));
      }
    }
  }
}
