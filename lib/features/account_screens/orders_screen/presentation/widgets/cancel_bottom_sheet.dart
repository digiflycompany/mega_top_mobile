import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/account_screens/orders_screen/presentation/widgets/cancel_radio_button.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/bottom_sheet_app_bar.dart';

class CancelBottomSheet extends StatelessWidget {
  const CancelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.372,
        color: Colors.white,
        child: Column(
          children: [
            const BottomSheetAppBar(AppStrings.sortByEn),
            VerticalSpace(context.height * 0.033),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Column(
                children: [
                  const CancelBottomSheetAdaptiveRadioButton(
                    value: AppStrings.defaultEn,
                    label: AppStrings.defaultEn,
                  ),
                  VerticalSpace(context.height * 0.01),
                  const CancelBottomSheetAdaptiveRadioButton(
                    value: AppStrings.fromHighToLowEn,
                    label: AppStrings.priceEn,
                  ),
                  VerticalSpace(context.height * 0.01),
                  const CancelBottomSheetAdaptiveRadioButton(
                    value: AppStrings.fromLowToHighEn,
                    label: AppStrings.price2En,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
