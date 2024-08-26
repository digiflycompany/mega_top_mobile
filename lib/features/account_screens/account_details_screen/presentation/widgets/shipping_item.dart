import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key, this.mainIcon, this.title});

  final String? mainIcon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:16.h),
      child: AccountOptionItem(
        mainIcon: mainIcon ?? AppAssets.shippingIcon,
        title: title ?? AppLocalizations.of(context)!.shippingAddresses,
        onTap: ()=>Routes.shippingAddressPageRoute.moveTo,
      ),
    );
  }
}
