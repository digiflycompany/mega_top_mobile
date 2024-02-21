import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_string.dart';

class TotalPriceAmountRow extends StatelessWidget {
  final String? totalAmount;
  const TotalPriceAmountRow({
    super.key,
    this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Total Amount Text
        Text(
          AppStrings.totalAmountEn,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        ),
        const Spacer(),

        /// Total Amount
        Text(
          totalAmount!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        ),

        /// LE
        Text(
          AppStrings.leEn,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp),
        )
      ],
    );
  }
}
