import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryTitle extends StatelessWidget {
  final String? text;
  final double fontSize;
  const DeliveryTitle({super.key, this.text, this.fontSize=16});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: fontSize.sp
      ),
    );
  }
}
