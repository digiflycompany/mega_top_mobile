// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
const num FIGMA_DESIGN_WIDTH = 414;
const num FIGMA_DESIGN_HEIGHT = 857;
const num FIGMA_DESIGN_STATUS_BAR = 39.216;

Size size = WidgetsBinding.instance.window.physicalSize / WidgetsBinding.instance.window.devicePixelRatio;
get width {
  return size.width;
}
double getHorizontalSize(double px) {
  return ((px * width) / FIGMA_DESIGN_WIDTH);
}
double getVerticalSize(double px) {
  return ((px * height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR));
}
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}
get height {
  //this binding???
  num statusBar = MediaQueryData.fromView(WidgetsBinding.instance.window).viewPadding.top;
  num bottomBar = MediaQueryData.fromView(WidgetsBinding.instance.window).viewPadding.bottom;
  num screenHeight = size.height - statusBar - bottomBar;
  return screenHeight;
}
EdgeInsetsDirectional getMargin({
  double? all,
  double? start,
  double? top,
  double? end,
  double? bottom,
  double? vertical,
  double? horizontal,
}) {
  return getMarginOrPadding(
      all: all, start: start, top: top, end: end, bottom: bottom, vertical: vertical, horizontal: horizontal);
}
EdgeInsetsDirectional getMarginOrPadding({
  double? all,
  double? start,
  double? top,
  double? end,
  double? bottom,
  double? vertical,
  double? horizontal,
}) {
  if (all != null) {
    start = all;
    top = all;
    end = all;
    bottom = all;
  }
  if (vertical != null) {
    top = vertical;
    bottom = vertical;
  }
  if (horizontal != null) {
    start = horizontal;
    end = horizontal;
  }
  return EdgeInsetsDirectional.only(
    start: getHorizontalSize(
      start ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    end: getHorizontalSize(
      end ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}