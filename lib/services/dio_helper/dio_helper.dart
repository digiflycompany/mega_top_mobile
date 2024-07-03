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
      {required String url,
      Map<String, dynamic>? queryParameters,
      String username = 'ck_9d47524cd8ae5eb47260cf8cf34144b04c219a45',
      String password = 'cs_b20f3ce367d0ceac7d671b9e85832dd4a5324b73',
      Map<String, dynamic>? data}) async {
    //String? token = PreferencesHelper.getToken();
    try {
      Map<String, dynamic> headers = {};
      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      headers['Authorization'] = basicAuth;
      Response? response = await dio?.post(
        url,
        queryParameters: queryParameters,
        //   options: Options(headers: {'Authorization': 'Bearer ${token}'}),
        data: data,
        options: Options(headers: headers),
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
    String username = 'ck_9d47524cd8ae5eb47260cf8cf34144b04c219a45',
    String password = 'cs_b20f3ce367d0ceac7d671b9e85832dd4a5324b73',
  }) async {
    try {
      Map<String, dynamic> headers = {};

      String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$username:$password'));
      headers['Authorization'] = basicAuth;
      Response? response = await dio?.get(
        url,
        queryParameters: queryParameters,
        //  options: Options(headers: headers),
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
