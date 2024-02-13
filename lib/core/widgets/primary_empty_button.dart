import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_color.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color  borderColor;
  final Color?  textColor;
  const PrimaryOutlinedButton({super.key, this.onTap, this.text, this.borderColor=AppColors.primaryColor, this.textColor=AppColors.primaryColor,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height*0.069,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width:1,color: borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child:  Center(
          child: Text(
            text!,
            style:TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 17.sp
            ),
          ),
        ),
      ),
    );
  }
}
