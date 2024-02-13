import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_color.dart';

class CartListProductQuantity extends StatelessWidget {
  final String? number;
  const CartListProductQuantity({super.key, this.number});

  @override
  Widget build(BuildContext context) {
    return Text(
      number!,
      style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700
      ),
    );
  }
}
