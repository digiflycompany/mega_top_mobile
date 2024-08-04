import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    this.mainIcon,
    this.title,
    this.optionalData,
  });

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: AccountOptionItem(
        mainIcon: mainIcon ?? AppAssets.profileIcon,
        title: title ?? AppStrings.profile,
        onTap: ()=>Routes.profilePageRoute.moveTo,
      ),
    );
  }
}
