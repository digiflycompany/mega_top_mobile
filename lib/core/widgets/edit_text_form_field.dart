import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class EditTextField extends StatelessWidget {
  final Widget? suffix;
  final TextEditingController? controller;
  const EditTextField({super.key, this.suffix, required this.title, this.controller, this.hintText});

  final String title;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp)),
        TextFormField(
          controller: controller,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
          cursorColor: AppColors.blackGreyColor,
          cursorHeight: context.width * 0.046,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.hintColor,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp),
            enabledBorder: const UnderlineInputBorder(
              borderSide:
              BorderSide(width: 1, color: AppColors.googleButtonBorder),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
            ),
            prefixIconConstraints:
            BoxConstraints(minWidth: context.width * 0.072),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
