import 'package:flutter/material.dart';

import '../../../../core/utils/app-color.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.onboardingBackgroundColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, size.height + 100,
          size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}