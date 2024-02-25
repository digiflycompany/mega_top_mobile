import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key, this.mainIcon, this.title, this.onTap});

  final String? mainIcon;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(
      mainIcon: mainIcon ?? AppAssets.shippingIcon,
      title: title ?? AppStrings.shippingAddresses,
      onTap: onTap,
    );
  }
}