// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
//
//
// void responseErrorHandler({required BuildContext context, Response? response}) {
//   CustomSnackBars.showErrorToast(
//       title: '${response?.data?['msg']}');
// }
// void errorHandler(
//     {required BuildContext context,
//       Response? response,
//       bool? showTopSnackBar}) {
//   if (response?.statusCode == 400) {
//     CustomSnackBars.showErrorToast(
//         title: response?.statusMessage ?? 'Bad request error');
//   } else if (response?.statusCode == 500) {
//     CustomSnackBars.showErrorToast(title: 'خطأ في السيرفر');
//   } else if (response?.statusCode == 401) {
//     PreferencesHelper.logOut();
//     AwesomeDialog(
//         context: context,
//         title: "Authentiation Error",
//         desc: 'قم بتسجيل الدخول مجددا',
//         dialogType: DialogType.error,
//         btnOkOnPress: () {})
//         .show();
//   } else if (response?.statusCode == 404) {
//     CustomSnackBars.showErrorToast(title: 'notFoundError');
//   }
// }
