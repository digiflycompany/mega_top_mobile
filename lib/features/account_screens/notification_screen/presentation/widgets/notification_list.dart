import 'package:flutter/material.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_string.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: context.height*0.016,bottom: context.height*0.016,right: context.width*0.022,left: context.width*0.022),
          child:const NotificationCard(
            notificationImage: AppAssets.addPhoto,
            notificationDiscountPercent: AppStrings.fiftyPercent,
            notificationDescription: AppStrings.emptyComparePageDescriptionEn,
            notificationDate: AppStrings.notificationDate,)
        );
      },
    );
  }
}
