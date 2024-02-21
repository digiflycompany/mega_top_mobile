import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet_body.dart';

import '../../../../core/utils/app_string.dart';
import 'bottom_sheet_app_bar.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const BottomSheetAppBar(AppStrings.filterByEn),
          VerticalSpace(context.height * 0.033),
          const FilterBottomSheetBody(),
        ],
      ),
    );
  }
}
