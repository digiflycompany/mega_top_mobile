import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/services/shared_preferences/preferences_helper.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignOutItem extends StatelessWidget {
  const SignOutItem({super.key, this.mainIcon, this.title});

  final String? mainIcon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 33.h),
      child: AccountOptionItem(
        mainIcon: mainIcon ?? AppAssets.signOutIcon,
        title: title ?? AppLocalizations.of(context)!.signOut,
        onTap: (){
          PreferencesHelper.logOut();
          Routes.homePageRoute.moveToCurrentRouteAndRemoveAll;
        }
      )
    );
  }
}
