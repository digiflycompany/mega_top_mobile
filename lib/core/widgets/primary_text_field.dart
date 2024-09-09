import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';

class PrimaryTextField extends StatelessWidget {
  final String? hintText;
  final String? prefixSvg;
  final Widget? suffix;
  final int? max;
  final validator;
  final controller;
  final TextInputType? inputType;  // New optional parameter for input type

  const PrimaryTextField({
    super.key,
    this.hintText,
    this.prefixSvg,
    this.suffix,
    this.validator,
    this.controller,
    this.max,
    this.inputType,  // Initialize new parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.blackGreyColor,
      cursorHeight: context.width * 0.046,
      maxLength: max,
      validator: validator,
      controller: controller,
      keyboardType: inputType ?? TextInputType.text,  // Use input type or default to text
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        hintStyle: TextStyle(
          color: AppColors.greyTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.googleButtonBorder),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: context.width * 0.072),
        prefixIcon: prefixSvg != null
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              prefixSvg!,
              width: context.width * 0.063,
              height: context.height * 0.026,
              fit: BoxFit.scaleDown,
            ),
          ],
        )
            : null,  // Handle null prefixSvg gracefully
        suffixIcon: suffix,
      ),
    );
  }
}
