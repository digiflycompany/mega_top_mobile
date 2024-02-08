import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_color.dart';

class PrimaryEmptyButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final double horizontalPadding;
  const PrimaryEmptyButton({super.key, this.onTap, this.text, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:horizontalPadding),
        child: Container(
          width: double.infinity,
          height: context.height*0.069,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child:  Center(
            child: Text(
              text!,
              style:  TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp
              ),
            ),
          ),
        ),
      ),
    );
  }
}
