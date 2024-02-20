import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screen/presentation/widgets/account_option_item.dart';

class TermsAndConditionsItem extends StatelessWidget {
  const TermsAndConditionsItem(
      {super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return const AccountOptionItem(
      mainIcon: AppAssets.information,
      title: AppStrings.termsAndConditions,
    );
  }
}
