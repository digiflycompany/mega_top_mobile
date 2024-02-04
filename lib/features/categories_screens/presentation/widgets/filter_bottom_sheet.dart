import 'package:flutter/material.dart';
import '../../../../core/utils/app_string.dart';
import 'bottom_sheet_app_bar.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        children: [
          BottomSheetAppBar(AppStrings.filterByEn),
        ],
      ),
    );
  }
}
