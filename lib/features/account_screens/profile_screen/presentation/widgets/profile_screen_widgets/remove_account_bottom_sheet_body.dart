import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/core/widgets/primary_button.dart';
import 'package:mega_top_mobile/core/widgets/primary_button_text.dart';
import 'package:mega_top_mobile/core/widgets/primary_empty_button.dart';

class RemoveAccountBottomSheetBody extends StatelessWidget {
  const RemoveAccountBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width16),
      child: Column(
        children: [
          VerticalSpace(context.height * 0.033),
          Text(AppStrings.areYouSureYouWantToRemoveYourAccount,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          VerticalSpace(context.height24),
          PrimaryButton(
              content:PrimaryButtonText(text: AppStrings.removeAccountCapitalA,),
              buttonColor: AppColors.red,
          ),
          VerticalSpace(context.height16),
          PrimaryOutlinedButton(
            text: AppStrings.cancelEn,
            borderColor: AppColors.red,
            textColor: AppColors.red,
            onTap:()=>Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
