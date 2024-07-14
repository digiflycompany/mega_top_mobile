import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/delete_account_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/email_verification_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/login_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/reset_password_model.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/sign_up_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class AuthRepo {
  Future<UserModel?> login(String email, String password);
  Future<DeleteAccountModel?> delete(String email, int id);
  Future<EmailVerificationModel?> verifyEmail(String email, String activationOtp);
  Future<SignUpModel?> signUp(String username, String email, String password, String confirmPassword);
  Future<ResetPasswordModel?> resetPassword(String email);
  Future<EmailVerificationModel?> updatePassword(String otp, String email, String password, String confirmPassword);

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
      // Optionally, rethrow the error to let the caller handle it
      throw e;
    }
    return null;
  }

  @override
  Future<SignUpModel?> signUp(
      String fullName,
      String phoneNumber,
      String email,
      String password
      ) async {
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
      if (response != null && response.statusCode == 200) {
        SignUpModel user = SignUpModel.fromJson(response.data);
        return user;
      }
    } catch (e) {
      print('Error during SignUp: $e');
    }
    return null;
  }

  Future<EmailVerificationModel?> verifyEmail(String email, String activationOtp) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.activateEmailAPI,
        data: {
          'email': email,
          'activation_otp': activationOtp,
        },
      );
      if (response != null && response.statusCode == 200) {
        EmailVerificationModel emailVerificationModel = EmailVerificationModel.fromJson(response.data);
        return emailVerificationModel;
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return null;
  }

  @override
  Future<ResetPasswordModel?> resetPassword(String email) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.resetPasswordAPI,
        data: {
          'email': email,
        },
      );
      if (response != null && response.statusCode == 200) {
        ResetPasswordModel resetPasswordModel = ResetPasswordModel.fromJson(response.data);
        return resetPasswordModel;
      }
    } catch (e) {
      print('Error during reset password: $e');
    }
    return null;
  }

  @override
  Future<EmailVerificationModel?> updatePassword(
      String otp,
      String email,
      String password,
      String confirmPassword
      ) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.updatePasswordAPI,
        data: {
          'otp': otp,
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
        },
      );
      if (response != null && response.statusCode == 200) {
        EmailVerificationModel user = EmailVerificationModel.fromJson(response.data);
        return user;
      }
    } catch (e) {
      print('Error during Updating Password: $e');
    }
    return null;
  }

  @override
  Future<DeleteAccountModel?> delete(String email, int id) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.deleteAccountAPI,
        data: {
          "email": email,
          "id": id
        },
      );
      if (response != null && response.statusCode == 200) {
        DeleteAccountModel deleteAccountModel = DeleteAccountModel.fromJson(response.data);
        return deleteAccountModel;
      }
    } catch (e) {
      print('Error during Account Deletion: $e');
    }
    return null;
  }

}
