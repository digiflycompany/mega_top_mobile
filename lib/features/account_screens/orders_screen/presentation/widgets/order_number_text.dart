import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

class OrderNumber extends StatelessWidget {
  final String orderNumber;
  final Color? textColor;
  const OrderNumber({super.key, required this.orderNumber, this.textColor});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            color:textColor??Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp
        ),
        children: [
          const TextSpan(text: AppStrings.orderNumberText),
          /// Order Number
          TextSpan(
            text: orderNumber,
            style: TextStyle(
              color:textColor??Colors.black,
              fontWeight: FontWeight.w700,
              //fontSize: 14.sp
            ),
          ),
        ],
      ),
    );
  }
}
