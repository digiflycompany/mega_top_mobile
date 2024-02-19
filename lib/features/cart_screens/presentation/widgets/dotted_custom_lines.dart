import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class DrawDottedHorizontalLine extends CustomPainter {
  final Paint _paint = Paint()
    ..color = AppColors.smallContainerGreyColor
    ..strokeWidth = 1.5
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i < size.width; i += 15) {
      canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
