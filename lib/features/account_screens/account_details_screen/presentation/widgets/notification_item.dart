import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key, this.mainIcon, this.title, this.optionalData, this.onTap});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: AccountOptionItem(
        mainIcon: mainIcon ?? AppAssets.notificationIcon,
        title: title ?? AppStrings.notifications,
        onTap: onTap,
        optionalData: optionalData ??
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.iconsBackgroundColor,
              ),
              width: 24.h,
              height: 24.h,
              child: const Center(
                child: Text(
                  "3",
                  style: TextStyle(
                      color: AppColors.primaryColor, fontWeight: FontWeight.w700),
                ),
              ),
            ),
      ),
    );
  }
}
