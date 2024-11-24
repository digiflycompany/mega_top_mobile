import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/filter_bottom_sheet_body.dart';
import 'bottom_sheet_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet(
      {super.key, required this.getProductsFunction, required this.cubit, this.brand});

  final Function getProductsFunction;
  final cubit;
  final bool? brand;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(children: [
          BottomSheetAppBar(AppLocalizations.of(context)!.filterBy),
          VerticalSpace(context.height * 0.033),
          FilterBottomSheetBody(
              getProductsFunction: getProductsFunction, cubit: cubit, brand: brand)
        ]));
  }
}