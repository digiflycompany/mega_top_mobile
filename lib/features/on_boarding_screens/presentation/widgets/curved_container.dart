import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'custom_curved_container.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, context.height*0.428),
      painter: ArcPainter(),
    );
  }
}
