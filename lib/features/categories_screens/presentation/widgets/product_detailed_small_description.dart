import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetailedSmallDescription extends StatelessWidget {
  final String? description;
  const ProductDetailedSmallDescription({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description!,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          height: context.width*0.005
      ),
    );
  }
}
