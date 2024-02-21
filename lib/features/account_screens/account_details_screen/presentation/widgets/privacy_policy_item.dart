import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';

class PrivacyPolicyItem extends StatelessWidget {
  const PrivacyPolicyItem(
      {super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(
      mainIcon: mainIcon ?? AppAssets.information,
      title: title ?? AppStrings.privacyPolicy,
    );
  }
}
