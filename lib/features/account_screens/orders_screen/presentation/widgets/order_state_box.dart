import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class OrderStateBox extends StatelessWidget {
  final double? width;
  final String text;
  final Color color;
  const OrderStateBox({super.key, this.width, required this.text, this.color=AppColors.yellowColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: context.height24,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:context.width8,vertical: context.height4),
          child: FittedBox(
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
