import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class CartListProductPrice extends StatelessWidget {
  final String? text;
  const CartListProductPrice({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700),
    );
  }
}
