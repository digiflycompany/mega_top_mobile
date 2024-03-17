import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class OrderConditionContainer extends StatelessWidget {
  final String? text;
  final Color borderColor;
  final Color textColor;
  final Function()? onTap;
  const OrderConditionContainer({super.key, this.text, this.borderColor=Colors.white, this.textColor = AppColors.greyTextColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          height: context.height*0.087,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: borderColor,
                width: 2.w,
              ),
            ),
          ),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
