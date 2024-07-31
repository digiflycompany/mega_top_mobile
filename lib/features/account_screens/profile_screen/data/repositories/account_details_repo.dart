import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/deactivated_user_model.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/updated_user_details_model.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/user_details_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class AccountDetailsRepo {
  Future<UserDetailsModel?> getUserDetails();
  Future<UpdatedUserDetailsModel?> updateUserDetails(String email ,String fullName ,String phone);
  Future<UpdatedUserDetailsModel?> updatePassword(String password,);
  Future<DeactivatedUserModel?> removeAccount();
  Future<UserDetailsModel?> removeProductFromWishList(String productId);

}

class AccountDetailsRepoImp implements AccountDetailsRepo {

  @override
  Future<UserDetailsModel?> getUserDetails() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.accountDetailsAPI,
        options: await DioHelper.getOptions(),
      );
      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return UserDetailsModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting user details: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<UpdatedUserDetailsModel?> updateUserDetails(String email, String fullName, String phone)  async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.updateAccountDetailsAPI,
        options: await DioHelper.getOptions(),
        data: {
          "fullName": fullName,
          "phoneNumber": phone,
          "email": email,
        },
      );
      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return UpdatedUserDetailsModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during getting user details: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<UpdatedUserDetailsModel?> updatePassword(String password) async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.updateAccountDetailsAPI,
        data: {
          "password": password
        },
        options: await DioHelper.getOptions(),
      );

      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return UpdatedUserDetailsModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during updating password: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<DeactivatedUserModel?> removeAccount() async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.deleteAccountAPI,
        options: await DioHelper.getOptions(),
      );

      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return DeactivatedUserModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during removing account: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<UserDetailsModel?> removeProductFromWishList(String productId) async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.removeFromWishListAPI,
        data: {
          "productId": productId
        },
        options: await DioHelper.getOptions(),
      );

      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return UserDetailsModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during updating password: $e');
      throw e;
    }
    return null;
  }

}
