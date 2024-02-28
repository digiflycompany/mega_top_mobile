import 'dart:convert';

import 'package:flutter/material.dart';

import 'app_routes_helper.dart';

extension StringExtension on String {
  String get removeSpaces => replaceAll(' ', '');
  int get codeFromString {
    String formattedStringColor = removeSpaces;
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6)
        ? formattedStringColor.addAtStart('FF')
        : formattedStringColor;
    return int.parse(formattedStringColor, radix: 16);
  }

  Color get colorFromString {
    String formattedStringColor = removeSpaces.toUpperCase();
    if (formattedStringColor.startsWith('#')) {
      formattedStringColor = formattedStringColor.replaceAll('#', '');
    } else if (formattedStringColor.startsWith('0x')) {
      formattedStringColor = formattedStringColor.replaceAll('0x', '');
    } else if (formattedStringColor.startsWith('0X')) {
      formattedStringColor = formattedStringColor.replaceAll('0X', '');
    }
    formattedStringColor = formattedStringColor.isLengthEqual(6)
        ? formattedStringColor.addAtStart('FF')
        : formattedStringColor;
    return Color(int.parse(formattedStringColor, radix: 16));
  }

  dynamic get fromStringToJson => jsonDecode(this);
  String get capitalize => toUpperCase();
  String addAtStart(String start) => "$start$this";
  bool isLengthEqual(int length) => this.length == length;
  int get toInt => int.parse(this);
  // String tr() {
  //   return AppLocalizations.of(AppService().getContext)!.translate(this) ?? this;
  // }
  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull => (isEmpty) || (this == 'null');
  String validate({String value = ''}) {
    if (isEmptyOrNull) {
      return value;
    } else {
      return this;
    }
  }

  bool isJson() {
    try {
      json.decode(validate());
    } catch (e) {
      return false;
    }
    return true;
  }

  isEqualTo(value) => this == value;
  isNotEqualTo(value) => this != value;
  get getBack => pop();

  get moveToAndRemoveCurrent => pushRoute(this, isToReplace: true);

  get moveToCurrentRouteAndRemoveAll => pushRoute(this, isNewTask: true);

  get moveTo => pushRoute(this);

  //get pushAndRemoveAllUntil => pushRoute(this, isNewTask: true);

  pushReplacementWithData(Map<String, dynamic>? arguments) =>
      pushRoute(this, isToReplace: true, arguments: arguments);

  pushWithData(Map<String, dynamic>? arguments) =>
      pushRoute(this, arguments: arguments);

  pushAndRemoveAllWithDataUntil(Map<String, dynamic>? arguments) =>
      pushRoute(this, isNewTask: true, arguments: arguments);
  popScreen([Object? object]) => pop(object);
  popScreenWithArgument([Object? object]) => pop(object);

  moveToCurrentRouteAndRemoveAllExceptThisRoute() =>
      pushRoute(this, isNewTask: true, exceptRoute: this);
  //get pushReplacement => pushRoute(this, isToReplace: true);
  //get push => pushRoute(this);
}

extension CutomMethodsOnNullObject on Object? {
  String get fromJsonToString => jsonEncode(this);
  bool get isNull => this == null;
  bool get isNotNull => this != null;
  bool get isNotNullAndIsFalse => this != null && this == false;
  bool get isNotNullAndIsTrue => this != null && this == true;
  bool get isNullOrIsFalse => this == null || this == true;
  bool get isNotNullOrFalse => this != null || this != true;
  bool get isNotFalse => this != false;
  bool get isNotTrue => this != true;
  bool get isTrue => this == true;
  bool get isFalse => this == false;
}

extension CutomMethodsOnObject on Object {
  isEqualTo(value) => this == value;
  isNotEqualTo(value) => this != value;
}

extension StringNullExtension on String? {
  String get validate => this == null ? '' : this!;
  int get toInt => validate.isEmpty ? 0 : int.parse(this!);
  bool get isNotNull => this != null;
  bool get isNull => this == null;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}

extension IntExtension on int {
  Duration get milliseconds => Duration(milliseconds: this);
  bool isSuccessful() => this >= 200 && this <= 206;
}

extension BullBoolExtension on bool? {
  /* null false , false false */
  bool get validate => this == null ? false : this!;
}

extension BoolExtension on bool {
  /* null false , false false */
  bool get isFalse => this == false;
  bool get isTrue => this == true;
}

extension ListExtension on List<dynamic>? {
  List<dynamic> get validate => this == null ? [] : this!;
}

/* json decode and encode*/
extension MapExtension on Map<String, dynamic> {}

extension DateTimeExtension on DateTime? {
  /*validate*/
  /* string to date time */
}

extension DynamicExtension on dynamic {
  Map<String, dynamic> get json => jsonDecode(this);
  isEqualTo(value) => this == value;
  isNotEqualTo(value) => this != value;
}

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

extension ScreenSizeExt on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Width getters
  double get width4 => screenWidth * 0.011;
  double get width6 => screenWidth * 0.017;
  double get width8 => screenWidth * 0.022;
  double get width12 => screenWidth * 0.033;
  double get width16 => screenWidth * 0.045;
  double get width20 => screenWidth * 0.055;
  double get width24 => screenWidth * 0.066;
  double get width28 => screenWidth * 0.077;
  double get width32 => screenWidth * 0.088;
  double get width40 => screenWidth * 0.11;
  double get width44 => screenWidth * 0.1225;
  double get width48 => screenWidth * 0.134;
  double get width52 => screenWidth * 0.142;
  double get width72 => screenWidth * 0.2;
  double get width88 => screenWidth * 0.245;
  double get width90 => screenWidth * 0.222;
  double get width104 => screenWidth * 0.285;
  double get width122 => screenWidth * 0.31;
  double get width135 => screenWidth * 0.351;
  double get width152 => screenWidth * 0.5;
  double get width238 => screenWidth * 0.6647;

  // Height getters
  double get height1 => screenHeight * 0.002;
  double get height1_8 => screenHeight * 0.005;
  double get height4 => screenHeight * 0.006;
  double get height6 => screenHeight * 0.009;
  double get height8 => screenHeight * 0.012;
  double get height11 => screenHeight * 0.015;
  double get height12 => screenHeight * 0.0165;
  double get height16 => screenHeight * 0.022;
  double get height20 => screenHeight * 0.028;
  double get height24 => screenHeight * 0.033;
  double get height27 => screenHeight * 0.037;
  double get height28 => screenHeight * 0.039;
  double get height32 => screenHeight * 0.044;
  double get height40 => screenHeight * 0.055;
  double get height48 => screenHeight * 0.065;
  double get height51 => screenHeight * 0.069;
  double get height64 => screenHeight * 0.087;
  double get height72 => screenHeight * 0.099;
  double get height90 => screenHeight * 0.131;
  double get height94 => screenHeight * 0.137;
  double get height104 => screenHeight * 0.141;
  double get height120 => screenHeight * 0.165;
  double get height128 => screenHeight * 0.174;
  double get height152 => screenHeight * 0.207;
  double get height183 => screenHeight * 0.252;
  double get height198 => screenHeight * 0.269;
  double get height204 => screenHeight * 0.281;
  double get height272 => screenHeight * 0.372;
  double get height300 => screenHeight * 0.407;
  double get height306 => screenHeight * 0.416;
}
