import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class EditTextField extends StatelessWidget {
  final Widget? suffix;
  const EditTextField({super.key, this.suffix, required this.title, this.text});

  final String title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp)),
        TextFormField(
          controller: TextEditingController(text: text),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
          cursorColor: AppColors.blackGreyColor,
          cursorHeight: context.width * 0.046,
          decoration: InputDecoration(
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
