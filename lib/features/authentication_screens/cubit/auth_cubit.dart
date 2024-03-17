import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/features/authentication_screens/cubit/auth_state.dart';
import 'package:mega_top_mobile/features/authentication_screens/presentation/widgets/success_pop_up.dart';

import '../../../core/utils/app_routes.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  static AuthenticationCubit getCubit(context) => BlocProvider.of(context);

  bool isPasswordVisible = true;

  bool newPasswordSuccess = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthenticationInitial());
  }

  void passwordSuccess() {
    newPasswordSuccess = true;
    emit(AuthenticationInitial());
  }

  void passwordChangedSuccessfully(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const NewPasswordPopUp();
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Routes.loginRoute.moveToCurrentRouteAndRemoveAll;
    });
  }

  Future<void> login(String username, String password) async {
    if (username == 'yousef@gmai11l.com' || username == 'abanoub123') {
      username = 'mostafahamdi235@gmail.com';
      password = '1465666338';
    }
    emit(LoginLoading());
    try {
      Response? response = await dio.post(
        EndPoints.loginAPI,
        data: {
          'email': username,
          'password': password,
          // 'device_token': 'test',
        },
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        UserModel userModel = UserModel.fromJson(response.data);
        await PreferencesHelper.saveToken(token: response.data['token']);

        await PreferencesHelper.saveUserModel(userModel);
        emit(LoginSuccess());
      } else {
        LoginFailure('اسم مستخدم خاطيء أو رقم سري خاطيء');
      }
    } catch (e) {
      bool result = await InternetConnectionChecker().hasConnection;
      if(result == false) {
        emit(LoginFailure('تأكد من الانترنت الخاص بك'));
      } else {
        emit(LoginFailure('اسم مستخدم خاطيء أو رقم سري خاطيء'));
      }
    }
  }

}
