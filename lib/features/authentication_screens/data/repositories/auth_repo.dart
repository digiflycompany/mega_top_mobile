import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/data/models/update_profile_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/delete_account_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/reset_password_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/user_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

abstract class AuthRepo {
  Future<UserModel?> login(String email, String password);
  Future<DeleteAccountModel?> delete(String email, int id);
  Future<UserModel?> verifyEmail(String otp);
  Future<UserModel?> resendEmailCode();
  Future<UserModel?> signUp(
      String fullName, String phoneNumber, String email, String password);
  Future<UserModel?> resetPassword(String email);
  Future<ResetPasswordModel?> verifyResetPassword(String email, String resetPasswordCode);
  Future<UpdateProfileModel?> updatePassword(String password,);
}

class AuthRepoImp implements AuthRepo {
  @override
  Future<UserModel?> login(String email, String password) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.loginAPI,
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response?.statusCode == 200 || response?.statusCode == 400) {
        return UserModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during login: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<UserModel?> signUp(String fullName, String phoneNumber, String email,
      String password) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.signUpAPI,
        data: {
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
        },
      );
      if (response?.statusCode == 200 || response?.statusCode == 400) {
        return UserModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during SignUp: $e');
      throw e;
    }
    return null;
  }

  Future<UserModel?> verifyEmail(String otp) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.verifyEmailAPI,
        data: {
          'verificationCode': otp,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await PreferencesHelper.getToken()}',
          },
        ),
      );

      if (response?.statusCode == 200 || response?.statusCode == 500) {
        return UserModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during email verification: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<UserModel?> resetPassword(String email) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.resetPasswordAPI,
        data: {
          'email': email,
        },
      );
      if (response?.statusCode == 200 || response?.statusCode == 500) {
        return UserModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during reset password: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<ResetPasswordModel?> verifyResetPassword(String email, String resetPasswordCode) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.verifyResetPasswordAPI,
        data: {
          'email': email,
          'resetPasswordCode': resetPasswordCode,
        },
      );
      if (response?.statusCode == 200 || response?.statusCode == 500 || response?.statusCode == 403) {
        return ResetPasswordModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during verify reset password: $e');
      throw e;
    }
    return null;
  }

  @override
  Future<UpdateProfileModel?> updatePassword(String password) async {
    try {
      Response? response = await DioHelper.putData(
        url: EndPoints.updateAccountDetailsAPI,
        data: {
          "password": password
        },
        options: await DioHelper.getOptions(),
      );

      if (response?.statusCode == 200 || response?.statusCode == 401) {
        return UpdateProfileModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during updating password: $e');
      throw e;
    }
    return null;
  }


  @override
  Future<DeleteAccountModel?> delete(String email, int id) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.deleteAccountAPI,
        data: {"email": email, "id": id},
      );
      if (response != null && response.statusCode == 200) {
        DeleteAccountModel deleteAccountModel =
            DeleteAccountModel.fromJson(response.data);
        return deleteAccountModel;
      }
    } catch (e) {
      print('Error during Account Deletion: $e');
    }
    return null;
  }

  @override
  Future<UserModel?> resendEmailCode() async {
    try {
      Response? response = await DioHelper.getData(
        url: EndPoints.resendEmailVerificationCode,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await PreferencesHelper.getToken()}',
          },
        ),
      );
      if (response?.statusCode == 200 || response?.statusCode == 403) {
        return UserModel.fromJson(response?.data);
      }
    } catch (e) {
      print('Error during email verification: $e');
      throw e;
    }
    return null;
  }

}
