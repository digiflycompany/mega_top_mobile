import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_services_dart.dart';

Future<T?> pushRoute<T>(
    String route, {
      bool isNewTask = false,
      bool isToReplace = false,
      String? exceptRoute,
      Map<String, dynamic>? arguments,
    }) async {
  var context = AppService().getContext;

  if (context == null) {
    throw Exception("Context is null. Unable to navigate.");
  }

  if (isNewTask) {
    return await Navigator.pushNamedAndRemoveUntil(
        context,
        route,
        exceptRoute != null && exceptRoute.isNotEmpty ? ModalRoute.withName(exceptRoute) : (route) => false,
        arguments: arguments
    );
  } else if (isToReplace) {
    return await Navigator.pushReplacementNamed(context, route, arguments: arguments);
  } else {
    return await Navigator.pushNamed(context, route, arguments: arguments);
  }
}

void pop([Object? object]) {
  var context = AppService().getContext;
  if (context != null && Navigator.canPop(context)) {
    Navigator.pop(context, object);
  }
}

push({required BuildContext context, required String route, Map<String, dynamic>? argument}) =>
    Navigator.pushNamed(context, route, arguments: argument);

canPop(BuildContext context) => Navigator.canPop(context);

pushAndRemove({required BuildContext context, required String route}) =>
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
