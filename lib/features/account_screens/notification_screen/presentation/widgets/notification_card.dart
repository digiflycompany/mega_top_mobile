import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_date.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_description.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_image.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_title.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height*0.41,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadow,
            offset: Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(right: context.width*0.022,left: context.width*0.022,top: context.height*0.012,bottom:context.height*0.012),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationCardImage(photo: AppAssets.addPhoto),
            NotificationCardTitle(discountPercent: AppStrings.fiftyPercent,),
            NotificationCardDescription(description: AppStrings.emptyComparePageDescription2En,),
            Spacer(),
            NotificationCardDate(date: AppStrings.notificationDate)
          ],
        ),
      ),
    );
  }
}
