import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/extensions.dart';
import 'package:mega_top_mobile/core/widgets/no_internet_page.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/cubit/notification_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/cubit/notification_state.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/notification_card.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/widgets/shimmer_notification_card.dart';
import 'package:mega_top_mobile/features/cart_screens/presentation/widgets/empty_response_page.dart';
import 'package:mega_top_mobile/features/home_screens/presentation/widgets/primary_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, context.height * 0.089),
            child: PrimaryAppBar(AppLocalizations.of(context)!.notifications,
                favour: false)),
        body: BlocConsumer<NotificationCubit, NotificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NotificationLoading) {
                return ShimmerNotificationCard();
              } else if (state is NotificationSuccess &&
                  state.user.notifications!.length > 0) {
                return Padding(
                    padding: EdgeInsets.only(
                        right: context.width * 0.022,
                        left: context.width * 0.022,
                        top: context.height * 0.016,
                        bottom: context.height * 0.016),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.user.notifications!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final notificationItem =
                              state.user.notifications![index].adId;
                          return Padding(
                              padding: EdgeInsets.only(
                                  top: context.height * 0.016,
                                  bottom: context.height * 0.016,
                                  right: context.width * 0.022,
                                  left: context.width * 0.022),
                              child: NotificationCard(
                                  notificationImage: notificationItem.image,
                                  notificationTitle: notificationItem.title,
                                  notificationDescription:
                                      notificationItem.description,
                                  notificationDate:
                                      notificationItem.updatedAt));
                        }));
              } else if (state is NotificationSuccess &&
                  state.user.notifications!.length == 0) {
                return EmptyDataPage(
                  icon: AppAssets.emptyNotificationsIcon,
                  bigFontText: AppLocalizations.of(context)!.noNotifications,
                  smallFontText:
                      AppLocalizations.of(context)!.thereIsNoNewNotification,
                );
              } else if (state is NotificationNoInternetConnection) {
                return NoInternetScreen(
                    buttonOnTap: () => context
                        .read<NotificationCubit>()
                        .getUserNotification());
              }
              return Center(
                  child: Text(AppLocalizations.of(context)!.serverError,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp)));
            }));
  }
}