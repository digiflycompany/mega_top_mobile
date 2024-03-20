import 'package:dio/dio.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/authentication_screens/data/models/login_model.dart';
import 'package:mega_top_mobile/services/dio_helper/dio_helper.dart';

abstract class AuthRepo {
  Future<UserModel?> login(String email, String password);
  Future<UserModel?> signUp(String username, String email, String password, String confirmPassword);
}

class AuthRepoImp implements AuthRepo {
  @override
  Future<UserModel?> login(String email, String password) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.loginAPI,
        data: {
          'username': email,
          'password': password,
        },
      );
      if (response != null && response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        return user;
      }
    } catch (e) {
      print('Error during login: $e');
    }
    return null;
  }

  @override
  Future<UserModel?> signUp(String username, String email, String password,
      String confirmPassword) async {
    try {
      Response? response = await DioHelper.postData(
        url: EndPoints.signUpAPI,
        data: {
          'email': email,
          'full_name': username,
          'password': password,
          'confirm_password': confirmPassword,
        },
      );
      if (response != null && response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        return user;
      }
    } catch (e) {
      print('Error during SignUp: $e');
    }
    return null;
  }
}
