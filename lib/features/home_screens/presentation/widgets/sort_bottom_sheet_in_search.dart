import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_radio_button.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/spacer.dart';

class SortBottomSheetInSearch extends StatelessWidget {
  const SortBottomSheetInSearch({super.key, required this.onTapDefault, required this.onTapFromHighPrice, required this.onTapFromLowPrice, required this.cubit});

  final Function onTapDefault;
  final Function onTapFromHighPrice;
  final Function onTapFromLowPrice;
  final cubit;


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
                   SortBottomSheetAdaptiveRadioButton(
                    value: AppStrings.defaultEn,
                    label: AppStrings.defaultEn,
                    description: '',
                    onTap:onTapDefault ,
                     cubit: cubit,
                  ),
                  VerticalSpace(context.height * 0.01),
                   SortBottomSheetAdaptiveRadioButton(
                    value: AppStrings.fromHighToLowEn,
                    label: AppStrings.priceEn,
                    description: AppStrings.fromHighToLowEn,
                     onTap: onTapFromHighPrice,
                     cubit: cubit,
                  ),
                  VerticalSpace(context.height * 0.01),
                  SortBottomSheetAdaptiveRadioButton(
                    value: AppStrings.fromLowToHighEn,
                    label: AppStrings.price2En,
                    description: AppStrings.fromLowToHighEn,
                    onTap: onTapFromLowPrice,
                    cubit: cubit,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
