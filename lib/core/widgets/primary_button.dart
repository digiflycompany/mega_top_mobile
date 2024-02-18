import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final int? fontSize;
  final bool isBlurred;

  const PrimaryButton({
    super.key,
    this.onTap,
    this.text,
    this.fontSize,
    this.isBlurred = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height*0.069,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                text!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
            if (isBlurred)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
