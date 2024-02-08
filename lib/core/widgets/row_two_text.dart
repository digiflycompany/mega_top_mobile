import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
class RowTextButton extends StatelessWidget {
  final String? firstText;
  final String? buttonText;
  final Function()? onTap;
  const RowTextButton({super.key, this.firstText, this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          firstText!,
          style:  TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp
          ),
        ),
        GestureDetector(
            onTap: onTap,
            child:  Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                buttonText!,
                style:  TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700
                ),
              ),
            ))
      ],
    );
  }
}
