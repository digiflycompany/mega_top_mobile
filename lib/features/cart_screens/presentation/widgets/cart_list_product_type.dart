import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class CartListProductType extends StatelessWidget {
  final String? text;
  const CartListProductType({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 10.sp),
    );
  }
}
