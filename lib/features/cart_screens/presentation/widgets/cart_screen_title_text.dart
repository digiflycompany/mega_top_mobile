import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';

class CartScreensTitleText extends StatelessWidget {
  final String text;
  const CartScreensTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height*0.033),
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.greyTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 14.sp
        ),
      ),
    );
  }
}
