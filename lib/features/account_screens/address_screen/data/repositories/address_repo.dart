import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/Errors/failures.dart';
import 'package:mega_top_mobile/core/Errors/models/api_error_model.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/cities_model.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/delete_address_model.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/update_address_model.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/user_address_model.dart';
import 'package:mega_top_mobile/features/account_screens/address_screen/data/models/user_addresses_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';
import 'package:dartz/dartz.dart';

abstract class AddressRepo {
  Future<Either<Failure, UserAddressesModel?>> getUserAddresses();
  Future<Either<Failure, UserAddress?>> getSingleAddress(String address);
  Future<CitiesModel?> getCities();
  Future<UserAddressModel?> addNewAddress(
      String name, String address, String addressDetails, String cityId);
  Future<DeleteAddressModel?> deleteAddress(String addressID);
  Future<Either<Failure, UpdateAddressModel?>> updateAddress(String addressID, String name,
      String address, String addressDetails, String cityId);
}

class AddressRepoImp implements AddressRepo {
  @override
  Future<Either<Failure, UserAddressesModel?>> getUserAddresses() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.userAddressesAPI,
        options: await DioHelper.getOptions(),
      );
      return right(UserAddressesModel.fromJson(response?.data));
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromResponse(error.response?.statusCode,
            ApiErrorResponse.fromJson(error.response?.data)));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  Future<Either<Failure, UserAddress?>> getSingleAddress(String addressId) async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.addAddressAPI + '/' + addressId,
        options: await DioHelper.getOptions(),
      );
      return right(UserAddress.fromJson(response?.data));
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromResponse(error.response?.statusCode,
            ApiErrorResponse.fromJson(error.response?.data)));
      } else {
        return left(ServerFailure('Something went wrong ${error.toString()}'));
      }
    }
  }

  @override
  Future<CitiesModel?> getCities() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.citiesAPI,
      );
      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return CitiesModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting cities: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<UserAddressModel?> addNewAddress(
      String name, String address, String addressDetails, String cityId) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.addAddressAPI,
        data: {
          "name": name,
          "firstLine": address,
          "cityId": cityId,
          "secondLine": addressDetails,
        },
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return UserAddressModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during adding new address: $e');
      throw e;
    }
    return null;
  }

  Future<DeleteAddressModel?> deleteAddress(
    String addressID,
  ) async {
    try {
      Response? response = await DioHelper.deleteData(
        url: EndPoints.removeAddressAPI(addressID),
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 ||
          response?.statusCode == 401 ||
          response?.statusCode == 400) {
        return DeleteAddressModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during adding new address: $e');
      throw e;
    }
    return null;
  }

  Future<Either<Failure, UpdateAddressModel?>> updateAddress(String addressID, String name,
      String address, String addressDetails, String cityId) async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.updateAddressAPI(addressID),
        data: {
          "name": name,
          "firstLine": address,
          "cityId": cityId,
          "secondLine": addressDetails
        },
        options: await DioHelper.getOptions()
      );
      return right(UpdateAddressModel.fromJson(response?.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromResponse(e.response?.statusCode,
            ApiErrorResponse.fromJson(e.response?.data)));
      } else {
        return left(ServerFailure('Something went wrong ${e.toString()}'));
      }
    }
  }
}
