import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_date.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_description.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_image.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card_title.dart';

class NotificationCard extends StatelessWidget {
  final String notificationImage;
  final String? notificationTitle;
  final String? notificationDescription;
  final String notificationDate;
  const NotificationCard({super.key, required this.notificationImage,
    required this.notificationTitle,
    required this.notificationDescription, required this.notificationDate,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height*0.38,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationCardImage(photo: notificationImage),
            NotificationCardTitle(title: notificationTitle,),
            NotificationCardDescription(description: notificationDescription),
            const Spacer(),
            NotificationCardDate(date: notificationDate)
          ],
        ),
      ),
    );
  }
}
