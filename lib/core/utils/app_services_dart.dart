import 'dart:async';
import 'package:flutter/material.dart';
class AppService {
  //

  /// Factory method that reuse same instance automatically
  factory AppService() => Singleton.lazy(() => AppService._());

  /// Private constructor
  AppService._() {}

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  get getContext => navigatorKey.currentState?.overlay?.context;
/*  BehaviorSubject<int> homePageIndex = BehaviorSubject<int>();
  BehaviorSubject<bool> refreshAssignedOrders = BehaviorSubject<bool>();
  BehaviorSubject<bool> refreshWalletBalance = BehaviorSubject<bool>();*/

/*  Lock lock = Lock();
  changeHomePageIndex({int index = 2}) async {
    print("Changed Home Page");
    homePageIndex.add(index);
  }*/

  /// if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  Future<T?> pushRoute<T>(
      String route, {
        bool isNewTask = false,
        bool isToReplace = false,
        String? exceptRoute,
        Map<String, dynamic>? arguments,
      }) async {
    if (isNewTask) {
      return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
          route,
          exceptRoute.isNotNull
              ? ModalRoute.withName(exceptRoute!)
              : (route) => false,
          arguments: arguments);
    } else if (isToReplace) {
      return await navigatorKey.currentState!
          .pushReplacementNamed(route, arguments: arguments);
    } else {
      return await navigatorKey.currentState!
          .pushNamed(route, arguments: arguments);
    }
  }

  /// Dispose current screens or close current dialog

  void pop([Object? object]) {
    if (Navigator.canPop(AppService().getContext))
      Navigator.pop(AppService().getContext, object);
  }

  static Map<String, dynamic>? getArguments(BuildContext context) =>
      (ModalRoute.of(context))!.settings.arguments as Map<String, dynamic>?;
/*  void showCustomDialog(
          {String? message,
          DialogTypes dialogType = DialogTypes.loading,
          bool dismissible = false}) =>
      showDialog(
        context: getContext,
        barrierDismissible: dismissible,
        builder: (context) {
          return  CustomDialog(
            message: message,
            dialogType: dialogType,
          );
        },
      );
  void showCustomDialogWithTimer({
    String? message,
    bool dismissible = false,
    DialogTypes dialogType = DialogTypes.loading,
    DialogTimingTypes dialogTimingType = DialogTimingTypes.long,
    void Function()? onTimeOut,
  }) {
    if (_isThereCurrentDialogShowing(getContext).isTrue) {
      pop();
    }
    showCustomDialog(
        message: message, dialogType: dialogType, dismissible: dismissible);
    Timer(
      Duration(
        milliseconds: dialogTimingType == DialogTimingTypes.long
            ? AppConstants.dialogLongDuration
            : AppConstants.dialogShortDuration,
      ),
      () {
        pop();
        if (onTimeOut.isNotNull) {
          onTimeOut!();
        }
      },
    );
  }*/

  /* check whether Alert Dialog is open */
  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
  /*hide keypad if it is shown*/
  get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();
  requestFocus(FocusNode focusNode) =>
      FocusScope.of(getContext).requestFocus(focusNode);
// T getBlocData<T extends StateStreamableSource<Object?>>() => BlocProvider.of<T>(getContext);
}
