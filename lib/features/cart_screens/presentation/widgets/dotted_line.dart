import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dotted_custom_lines.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child:
      CustomPaint(
        painter: DrawDottedHorizontalLine(),
        size: Size(context.width, 2),
      ),
      ),);
  }
}
