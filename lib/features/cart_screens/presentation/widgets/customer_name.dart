import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerName extends StatelessWidget {
  final String? text;
  final double fontSize;
  const CustomerName({super.key, this.text, this.fontSize=16});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        child: Text(
            text!,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: fontSize.sp
            ),
          ),
      ),
    );
  }
}
