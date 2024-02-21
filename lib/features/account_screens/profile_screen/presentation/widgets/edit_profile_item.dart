import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_option_item.dart';

class EditProfileItem extends StatelessWidget {
  const EditProfileItem({super.key, this.mainIcon, this.title, this.onTap});

  final String? mainIcon;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return const ProfileOptionItem(
      mainIcon: AppAssets.editProfileIcon,
      title: "Edit profile details",
      onTap: onTap,
    );
  }
}
