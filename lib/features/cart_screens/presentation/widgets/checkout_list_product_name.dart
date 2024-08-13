import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutListProductName extends StatelessWidget {
  final String? text;
  const CheckoutListProductName({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text!,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700,fontSize: 13.sp,height: 1.2.h),
    );
  }
}
