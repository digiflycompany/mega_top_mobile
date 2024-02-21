import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/features/profile_screen/presentation/widgets/profile_option_item.dart';

class EditPasswordItem extends StatelessWidget {
  const EditPasswordItem({super.key, this.mainIcon, this.title});

  final String? mainIcon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return  ProfileOptionItem(
      mainIcon: AppAssets.editPasswordIcon,
      title: "Edit password",
    );
  }
}
