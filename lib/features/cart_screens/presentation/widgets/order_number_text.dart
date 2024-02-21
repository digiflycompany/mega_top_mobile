import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class OrderNumberText extends StatelessWidget {
  final String? orderNumber;
  const OrderNumberText({super.key, this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(context.height * 0.023),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.yourOrderNumberIsEn,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
            Text(
              orderNumber!,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
          ],
        ),
      ],
    );
  }
}
