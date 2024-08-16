import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet_body.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/filter_bottom_sheet_body_in_search.dart';

import '../../../../core/utils/app_string.dart';

class FilterBottomSheetInSearch extends StatelessWidget {
  const FilterBottomSheetInSearch({super.key, required this.getProductsFunction,required this.cubit});

  final Function getProductsFunction;
  final cubit;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          const BottomSheetAppBar(AppStrings.filterByEn),
          VerticalSpace(context.height * 0.033),
          FilterBottomSheetBodyInSearch(
            getProductsFunction: getProductsFunction,
            cubit: cubit,
          ),
        ],
      ),
    );
  }
}
