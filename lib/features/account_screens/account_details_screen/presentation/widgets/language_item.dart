import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/locale/locale_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: AccountOptionItem(
        onTap: () {
          final currentLocale = context.read<LocaleCubit>().state;
          if (currentLocale.languageCode == 'en') {
            context.read<LocaleCubit>().toArabic();
          } else {
            context.read<LocaleCubit>().toEnglish();
          }
        },
        mainIcon: mainIcon ?? AppAssets.languageIcon,
        title: title ?? AppLocalizations.of(context)!.languages,
        optionalData: GestureDetector(
          child: optionalData ??Text(
                    AppLocalizations.of(context)!.language,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                    ),
                  )
        ),
      ),
    );
  }
}
