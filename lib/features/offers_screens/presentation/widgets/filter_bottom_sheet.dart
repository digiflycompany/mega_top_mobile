import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/offers_screens/presentation/widgets/filter_bottom_sheet_body.dart';

import '../../../../core/utils/app_string.dart';
import 'bottom_sheet_app_bar.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key, required this.getProductsFunction,required this.cubit});

  final Function getProductsFunction;
  final cubit;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const BottomSheetAppBar(AppStrings.filterByEn),
          VerticalSpace(context.height * 0.033),
          FilterBottomSheetBody(
            getProductsFunction: getProductsFunction,
            cubit: cubit,
          ),
        ],
      ),
    );
  }
}