import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';

class DioHelper {
  static BaseOptions opts = BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true,
    followRedirects: false,
    validateStatus: (status) {
      return status! <= 500;
    },
  );

  static Dio init() {
    return Dio(opts);
  }

  static Dio? dio = init();

  static Future<Response?> postData(
      {required String url, Map<String, dynamic>? data}) async {
    //String? token = PreferencesHelper.getToken();
    try {
      Response? response = await dio?.post(
        url,
        //   options: Options(headers: {'Authorization': 'Bearer ${token}'}),
        data: data,
      );
      if (kDebugMode) {
        print('STATUS CODE IS ${response?.statusCode}');
        print('STATUS MESSAGE IS ${response?.statusMessage}');
        print('SENT DATA IS ${response?.requestOptions.data}');
        print('RESPONSE IS ${response}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('DIO ERROR IS $e');
      }
      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    String username = 'ck_ae3cd70fbe1ce6ff699a31d0e753c60825d6cd91',
    String password = 'cs_e75fff73e9ee2caef0dd3faddfd5d2d9f5d85276',
  }) async {
    try {
      Map<String, dynamic> headers = {};

      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      headers['Authorization'] = basicAuth;
      Response? response = await dio?.get(
        url,
        queryParameters: queryParameters,
        //options: Options(headers: headers),
      );

      if (kDebugMode) {
        print('STATUS CODE IS ${response?.statusCode}');
        print('SENT DATA IS ${response?.requestOptions.data}');
        print('STATUS MESSAGE IS ${response?.statusMessage}');
        print('RESPONSE IS ${response}');
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('DIO ERROR IS $e');
      }
      return e is DioException ? e.response : null;
    }
  }

  static Future<Response?> putData(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      Response? response = await dio?.put(url, data: data);
      return response;
    } catch (e) {
      return e is DioException ? e.response : null;
    }
  }
}
