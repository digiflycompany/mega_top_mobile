import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_screen_widgets/profile_option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditPasswordItem extends StatelessWidget {
  const EditPasswordItem({super.key, this.mainIcon, this.title, this.onTap});

  final String? mainIcon;
  final String? title;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: ProfileOptionItem(
        mainIcon: AppAssets.editPasswordIcon,
        title: AppLocalizations.of(context)!.editPassword,
        onTap: onTap,
      ),
    );
  }
}
