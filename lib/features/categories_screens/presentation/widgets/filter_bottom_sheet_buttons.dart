import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_empty_button.dart';

class FilterBottomSheetButtons extends StatelessWidget {
  const FilterBottomSheetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.022),
      child: Column(
        children: [
          PrimaryButton(
            content: Text(
              AppStrings.applyEn,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            onTap: ()=>Navigator.pop(context),
          ),
          VerticalSpace(context.height * 0.033),
          PrimaryOutlinedButton(
            onTap: ()=>Navigator.pop(context),
            text: AppStrings.resetEn,
          ),
        ],
      ),
    );
  }
}
