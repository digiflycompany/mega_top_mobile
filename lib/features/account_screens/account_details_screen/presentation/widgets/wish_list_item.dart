import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';

class WishListItem extends StatelessWidget {
  const WishListItem(
      {super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(
              mainIcon: mainIcon ?? AppAssets.favourFilledIcon,
              title: title ?? AppStrings.wishList,
              onTap: () {
               Routes.wishListPageRoute.moveTo;
              },
              optionalData: optionalData ??
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconsBackgroundColor,
                    ),
                    width: 24.h,
                    height: 24.h,
                    child: Center(
                      child: Text(
                        PreferencesHelper.getWishListCount().toString(),
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
            );
  }
}
