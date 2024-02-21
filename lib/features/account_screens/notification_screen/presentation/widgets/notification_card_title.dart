import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';

class NotificationCardTitle extends StatelessWidget {
  final String discountPercent;
  const NotificationCardTitle({super.key, required this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:context.height*0.02),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp
          ),
          children: [
            const TextSpan(text: AppStrings.catchThe),
            TextSpan(
              text: AppStrings.fiftyPercent,
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp
              ),
            ),
            const TextSpan(text: AppStrings.offerAnSurveillance),
          ],
        ),
      ),
    );
  }
}
