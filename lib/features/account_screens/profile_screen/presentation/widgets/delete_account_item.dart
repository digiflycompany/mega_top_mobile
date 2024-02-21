import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/features/account_screens/profile_screen/presentation/widgets/profile_option_item.dart';

class DeleteAccountItem extends StatelessWidget {
  const DeleteAccountItem({super.key, this.mainIcon, this.title, this.onTap});

  final String? mainIcon;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return const ProfileOptionItem(
      mainIcon: AppAssets.deleteIcon,
      title: "Delete account",
      onTap: onTap,
    );
  }
}
