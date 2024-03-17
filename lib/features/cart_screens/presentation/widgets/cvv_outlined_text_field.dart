import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class CvvOutlinedTextField extends StatelessWidget {
  const CvvOutlinedTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.176,
      height: context.height * 0.044,
      child: TextFormField(
        cursorColor: AppColors.blackGreyColor,
        cursorHeight: 18.h,
        decoration: InputDecoration(
          hintText: AppStrings.cVVEn,
          hintStyle: TextStyle(
            color: AppColors.oldPriceColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.height * 0.006),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: context.width * 0.045),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blackGreyColor),
            borderRadius: BorderRadius.circular(context.height * 0.006),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.blackGreyColor),
            borderRadius: BorderRadius.circular(context.height * 0.006),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(3),
        ],
      ),
    );
  }
}
