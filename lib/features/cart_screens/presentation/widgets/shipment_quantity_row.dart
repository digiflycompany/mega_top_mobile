import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class ShipmentQuantityRow extends StatelessWidget {
  const ShipmentQuantityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Your Shipment Text
        Text(
          AppStrings.yourShipmentEn,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
        const Spacer(),

        /// Products Quantity
        Text(
          AppStrings.productsQuantityEn,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
          ),
        ),
        HorizontalSpace(context.width * 0.011),

        /// Products Text
        Text(
          AppStrings.productsEn,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
