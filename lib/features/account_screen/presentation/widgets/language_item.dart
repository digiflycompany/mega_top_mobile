import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screen/presentation/widgets/account_option_item.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(
      mainIcon: mainIcon ?? AppAssets.languageIcon,
      title: title ?? AppStrings.languages,
      optionalData: optionalData ??
          Text(AppStrings.selectedLanguage,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp)),
    );
  }
}
