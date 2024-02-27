import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

class OrderNumber extends StatelessWidget {
  final String orderNumber;
  const OrderNumber({super.key, required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp
        ),
        children: [
          const TextSpan(text: AppStrings.orderNumberText),
          /// Order Number
          TextSpan(
            text: orderNumber,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              //fontSize: 14.sp
            ),
          ),
        ],
      ),
    );
  }
}
