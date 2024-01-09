import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/size-utils.dart';




extension CutomMethodsOnNullObject on Object? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;

}



extension IntExtension on int {
  Duration get milliseconds => Duration(milliseconds: this);
  bool isSuccessful() => this >= 200 && this <= 206;
  double get h => getVerticalSize(toDouble());
  double get w => getHorizontalSize(toDouble());
  double get r => getVerticalSize(toDouble());

  SizedBox get vs => SizedBox(height: h);
  SizedBox get hs => SizedBox(width: w);
}



extension DoubleExtension on double {
  double get h => getVerticalSize(this);
  double get w => getHorizontalSize(this);
  double get r => getVerticalSize(this);

  SizedBox get vs => SizedBox(height:h);
  SizedBox get hs => SizedBox(width: w);
// double get w=>getSize(this);
}
