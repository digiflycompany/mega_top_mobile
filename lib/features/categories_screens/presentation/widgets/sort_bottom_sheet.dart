import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/utils/spacer.dart';
import 'package:mega_top_mobile/features/categories_screens/presentation/widgets/sort_radio_button.dart';
import 'bottom_sheet_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet(
      {super.key,
      required this.onTapDefault,
      required this.onTapFromHighPrice,
      required this.onTapFromLowPrice,
      required this.cubit});

  final Function onTapDefault;
  final Function onTapFromHighPrice;
  final Function onTapFromLowPrice;
  final cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height * 0.372,
        color: Colors.white,
        child: Column(children: [
          BottomSheetAppBar(AppLocalizations.of(context)!.sortBy),
          VerticalSpace(context.height * 0.033),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.045),
              child: Column(children: [
                SortBottomSheetAdaptiveRadioButton(
                    value: AppLocalizations.of(context)!.defaultWord,
                    label: AppLocalizations.of(context)!.defaultWord,
                    description: '',
                    onTap: onTapDefault,
                    cubit: cubit),
                VerticalSpace(context.height * 0.01),
                SortBottomSheetAdaptiveRadioButton(
                    value: AppLocalizations.of(context)!.fromHighToLow,
                    label: AppLocalizations.of(context)!.price,
                    description: AppLocalizations.of(context)!.fromHighToLow,
                    onTap: onTapFromHighPrice,
                    cubit: cubit),
                VerticalSpace(context.height * 0.01),
                SortBottomSheetAdaptiveRadioButton(
                    value: AppLocalizations.of(context)!.fromLowToHigh,
                    label: AppLocalizations.of(context)!.price,
                    description: AppLocalizations.of(context)!.fromLowToHigh,
                    onTap: onTapFromLowPrice,
                    cubit: cubit)
              ]))
        ]));
  }
}