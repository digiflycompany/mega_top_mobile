import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../utils/app_color.dart';

class AuthButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? content;
  final int? fontSize;

  const AuthButton({
    super.key,
    this.onTap,
    this.content,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height * 0.069,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Stack(
          children: [
            Center(
              child: content
            ),
          ],
        ),
      ),
    );
  }
}
