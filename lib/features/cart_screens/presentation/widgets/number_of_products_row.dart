import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_string.dart';

class NumberOfProductsRow extends StatelessWidget {
  final String? productQuantity;
  final String? productPrice;
  const NumberOfProductsRow(
      {super.key, this.productQuantity, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Number Of Products Text
        Text(
          AppStrings.numberOfProductsEn,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
        ),

        /// Product quantity
        Text(
          productQuantity!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
        ),
        const Spacer(),

        /// Product Price
        Text(
          productPrice!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
        ),

        /// LE
        Text(
          AppStrings.leEn,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp),
        )
      ],
    );
  }
}
