import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/spacer.dart';

class ProductPrices extends StatelessWidget {
  final String? currentPrice;
  final String? oldPrice;
  const ProductPrices({super.key, this.currentPrice, this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Product Current Price ///
        Text(
          currentPrice!,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp),
        ),
        HorizontalSpace(context.width * 0.045),

        /// Product Old Price ///
        Text(
          oldPrice!,
          style: TextStyle(
              color: AppColors.oldPriceColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              decoration: TextDecoration.lineThrough,
              decorationColor: AppColors.oldPriceColor,
              decorationThickness: 1.3),
        ),
      ],
    );
  }
}
