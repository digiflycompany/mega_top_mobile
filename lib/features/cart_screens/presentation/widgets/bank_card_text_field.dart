import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_string.dart';

class BankCardTextField extends StatelessWidget {
  const BankCardTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Card Number text
        Text(
          AppStrings.cardNumberEn,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        VerticalSpace(context.height * 0.012),

        /// Text Form Field
        TextFormField(
          cursorColor: AppColors.blackGreyColor,
          cursorHeight: context.width * 0.046,
          decoration: InputDecoration(
            hintText: AppStrings.enterTheCardNumberEn,
            hintStyle: TextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 1.w, color: AppColors.googleButtonBorder),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 1.w, color: AppColors.blackGreyColor),
            ),
            suffixIconConstraints:
                BoxConstraints(minWidth: context.width * 0.072),
            suffixIcon: Padding(
              padding: EdgeInsets.only(bottom: context.height * 0.012),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppAssets.visaCardImg,
                    width: context.width * 0.066,
                  ),
                  HorizontalSpace(context.width * 0.022),
                  Image.asset(
                    AppAssets.masterCardImg,
                    width: context.width * 0.066,
                  ),
                ],
              ),
            ),
            contentPadding: EdgeInsets.only(bottom: context.height * 0.012),
          ),
          keyboardType: TextInputType.number,
        )
      ],
    );
  }
}
