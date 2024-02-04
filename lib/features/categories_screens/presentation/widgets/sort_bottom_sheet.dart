import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_radio_button.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';
import 'bottom_sheet_app_bar.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height*0.372,
        color: Colors.white,
        child: Column(
          children: [
            const BottomSheetAppBar(AppStrings.sortByEn),
            VerticalSpace(context.height*0.033),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.width*0.045),
              child:  Column(
                children: [
                  const CustomAdaptiveRadioButton(
                    value: AppStrings.defaultEn,
                    label: AppStrings.defaultEn,
                    description: '',
                  ),
                  VerticalSpace(context.height*0.01),
                  const CustomAdaptiveRadioButton(
                    value: AppStrings.priceEn,
                    label: AppStrings.priceEn,
                    description: AppStrings.fromHighToLowEn,
                  ),
                  VerticalSpace(context.height*0.01),
                  const CustomAdaptiveRadioButton(
                    value: AppStrings.priceEn,
                    label: AppStrings.priceEn,
                    description: AppStrings.fromLowToHighEn,
                  ),
                ],
              ),
            ),

          ],
        )
    );
  }
}
