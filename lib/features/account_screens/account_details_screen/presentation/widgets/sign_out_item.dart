import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';

class SignOutItem extends StatelessWidget {
  const SignOutItem({super.key, this.mainIcon, this.title, this.onTap});

  final String? mainIcon;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 33.h),
      child: AccountOptionItem(
        mainIcon: mainIcon ?? AppAssets.signOutIcon,
        title: title ?? AppStrings.signOut,
        onTap: onTap,
      ),
    );
  }
}
