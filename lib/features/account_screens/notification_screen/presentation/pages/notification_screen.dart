import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../home_screens/presentation/widgets/primary_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  final bool isEmpty = false;
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: const PrimaryAppBar(
              AppStrings.notifications,
              favour: false,
            )),
        body: isEmpty?const EmptyDataPage(
          icon: AppAssets.emptyNotificationsIcon,
          bigFontText: AppStrings.noNotifications,
          smallFontText: AppStrings.emptyComparePageDescriptionEn,
        ): Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width*0.045),
          child: const Column(
            children: [
              NotificationCard()
            ],
          ),
        )
    );
  }
}
