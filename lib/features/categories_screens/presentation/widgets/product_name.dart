import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailedNameText extends StatelessWidget {
  final String? name;
  const ProductDetailedNameText({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return  Text(
      name!,
      style:  TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        color: Colors.black,
      ),
    );
  }
}
