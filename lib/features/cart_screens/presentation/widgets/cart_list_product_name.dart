import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartListProductName extends StatelessWidget {
  final String? text;
  const CartListProductName({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        text!,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 12.sp
        ),
      ),
    );
  }
}
