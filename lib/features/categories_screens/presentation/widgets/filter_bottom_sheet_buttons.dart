import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_empty_button.dart';

class FilterBottomSheetButtons extends StatelessWidget {
  const FilterBottomSheetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height*0.022),
      child: Column(
        children: [
          const PrimaryButton(
            text: AppStrings.applyEn,
          ),
          VerticalSpace(context.height*0.033),
          const PrimaryOutlinedButton(
            text: AppStrings.resetEn,
          ),
        ],
      ),
    );
  }
}
