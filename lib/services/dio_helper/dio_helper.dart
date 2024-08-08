import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/theme/api.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

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

  static Future<Options> getOptions() async {
    final token = await PreferencesHelper.getToken();
    return Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<bool> _hasInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (!await _hasInternetConnection()) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }

    try {
      Response? response = await dio?.post(url,
          data: data, queryParameters: queryParameters, options: options);
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

  static Future<Response?> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (!await _hasInternetConnection()) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }

    try {
      Response? response = await dio?.put(url,
          data: data, queryParameters: queryParameters, options: options);
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
    Options? options,
  }) async {
    if (!await _hasInternetConnection()) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }

    try {
      Response? response = await dio?.get(url,
          queryParameters: queryParameters, options: options);

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

  static Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (!await _hasInternetConnection()) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }

    try {
      Response? response = await dio?.delete(url,
          queryParameters: queryParameters, options: options);

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
}
