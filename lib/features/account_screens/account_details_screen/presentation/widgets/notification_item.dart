import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_top_mobile/core/utils/app_assets.dart';
import 'package:mega_top_mobile/core/utils/app_color.dart';
import 'package:mega_top_mobile/core/utils/app_routes.dart';
import 'package:mega_top_mobile/features/account_screens/account_details_screen/presentation/widgets/account_option_item.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/data/repositories/notification_repo.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/cubit/notification_cubit.dart';
import 'package:mega_top_mobile/features/account_screens/notification_screen/presentation/cubit/notification_state.dart';
import 'package:mega_top_mobile/services/shared_preferences/preferences_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key, this.mainIcon, this.title, this.optionalData});

  final String? mainIcon;
  final String? title;
  final Widget? optionalData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(NotificationsRepoImp())..getUserNotification(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<NotificationCubit>();
          return BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: AccountOptionItem(
                  mainIcon: mainIcon ?? AppAssets.notificationIcon,
                  title: title ?? AppLocalizations.of(context)!.notifications,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.notificationPageRoute).then((_) {
                      cubit.getUserNotification();
                    });
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
                            PreferencesHelper.getNotificationCount().toString(),
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
